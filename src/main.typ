#import "@preview/physica:0.9.5":*
#import "@preview/subpar:0.2.2" as subpar


// PARAMETERS
#set page(margin: (x:25mm, y:auto), numbering : "1")
#set text(font:"Times New Roman", size:12pt)
#set heading(numbering : "1.")
#show heading: set text(font: "New York Small")
#set par(justify: true)
#set text(lang: "en", hyphenate: true)
#set math.mat(delim: "[")
#set figure.caption(separator: [ --- ])

#set math.equation(numbering: "(1)")
#show math.equation: it => {
  if it.block and not it.has("label") [
    #counter(math.equation).update(v => v - 1)
    #math.equation(it.body, block: true, numbering: none)#label("")
  ] else {
    it
  }  
}


#show link: set text(fill: blue)

#show figure.caption: c => context [
  #text(weight: "bold")[#c.supplement #c.counter.display(c.numbering) #c.separator]	
  #c.body
]

// FILE DESC
#set document(
     title:"À venir",
     author:"Erwan Le Doeuff",
     date: datetime(year:2025, month:10, day:24)
)


#let appendix(body) = {
  set heading(numbering: "A.1.", supplement: [Appendix])
  counter(heading).update(0)
  body

}


#show raw.where(block: false): box.with(
  fill: rgb(0%, 30%, 100%, 10%),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 4pt),
  radius: 3pt,
)


#show raw.where(block: true): box.with(
  width: 100%,
  fill: rgb(0%, 30%, 100%, 20%),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 6pt),
  radius: 3pt,
)


#let nonumber(body) = {
    set heading(numbering: none, outlined: false)
  body
}

#nonumber[= Remerciements]


#align(right)[
    #emph[
        Ret e voe din dibab ‘tre div vuhez,#linebreak()
        En-dro d'ar familh, en-dro d'an enorioù.#linebreak()
        Met n'eus ket a enor hep familh,#linebreak()
        Setu perak emañ ar gerioù-mañ.#linebreak()

        Papa, Maman, me ‘zo aet kuit#linebreak()
        War hent ar studioù, pell diouzh an ti,#linebreak()
        Pell diouzh ho karantez, pell diouzh ar c’hi,#linebreak()
        Hag ar c’hazh sioul tal an tan.#linebreak()

        Kavet em eus ur garantez,#linebreak()
        Kollet em eus ur mignon,#linebreak()
        Gouelañ a ran noz-ha-deiz,#linebreak()
        Ne vo ken a «ken ar c’hentañ».#linebreak()

        Soñjal a ran eus ma zud-kozh,#linebreak()
        D’an amzer a dremen,#linebreak()
        D’ar glav ha d’an amzer vat,#linebreak()
        O c’hortoz an deiz, o tremen hep bezañ.#linebreak()
    ]
]


#pagebreak()
#outline()

#pagebreak()
#set page(columns:1, header:[_Ligand-membrane coupling as a pre-filter for receptor engagement_])

= Introduction (4-5 pages)

== Biological and pharmacological context

Cellular communication relies on molecular signals that must be detected and interpreted at the cell surface. In many cases, this process involves membrane receptors embedded in the plasma membrane, which translate extracellular or membrane--associated signals into intracellular responses. The membrane is therefore not only a physical boundary separating the cell from its environment, but also the cellular compartment in which many signaling events are initiated.

Traditional pharmacological frameworks implicitly assume that neurotransmitters diffuse through aqueous media before encountering their receptor @ritter_rang_2020. This picture, while adequate for hydrophilic signaling molecules, becomes incomplete in the case of the endocannabinoid system (ECS) --- a central regulator of neural activity, and a major pharmacological target in neurological and metabolic disorders. Endocannabinoids are lipid-derived molecules synthesized on demand from the hydrolysis of membrane phospholipids @venance_systeme_2004. This biochemical origin confers lipophilic properties, meaning that these molecules preferentially partition into hydrophobic environments rather than the surrounding aqueous phase.

Among the main molecular targets of the ECS, the cannabinoid receptor type 1 (CB1) is one of the most abundantly expressed G protein-coupled receptors (GPCRs) in the mammalian central nervous system. Structural and pharmacological evidence suggests that access to its orthosteric binding pocket may occur laterally from within the bilayer rather than directly from the extracellular bulk @hurst_lipid_2010 @jakowiecki_hydrophobic_2020. This pathway is relevant not only for endogenous cannabinoids such as anandamide and 2-arachidonoylglycerol (2--AG), but also for exogenous ligands targeting CB1 @thakur_cb1_2005. These include phytocannabinoids such as $Delta$9-tetrahydrocannabinol (THC), as well as synthetic compounds developed for pharmacological purposes, among which CP55,940 and WIN55.212-2 are potent agonists, and rimonabant (SR141716A) a well-known inverse agonist.

The presynaptic membrane environment, which constitutes an essential component of endocannabinoid signaling, is enriched in sterols, phospholipids, and sphingolipids @ahrends_synaptoneurolipidomics_2025 @lauwers_membrane_2016. Lipidomic analyses have revealed significant compositional alterations under pathological conditions, including depletion of $omega$--3 and $omega$--6 polyunsaturated fatty acids (PUFAs) in patients experiencing a first psychotic episode @le_analysis_2023 @frajerman_lipides_2020. From a biophysical standpoint, such compositional shifts modify membrane properties including acyl chain order, interfacial hydration, bilayer thickness and bending rigidity --- parameters that directly influence ligand partitioning and mobility within the bilayer. Understanding how membrane composition modulates these ligand--membrane interactions therefore appears essential for describing the early physicochemical steps preceding CB1 engagement.

== Lipid membranes as physicochemical systems

Lipid membranes are not homogeneous solvents but instead complex physicochemical systems, exhibiting rich phase behavior. This complexity is mainly brought by the diversity of their molecular constituents: headgroups, acyl chain saturation, and sterol content.

#figure(
    image("rsrc/bilayer.png", width:95%),
    caption: [Schematic representation of phospholipid amphiphilicity and bilayer organization. Hydrophilic headgroups orient toward the aqueous phase, whereas hydrophobic acyl chains assemble into the membrane core, leading to the spontaneous formation of lipid bilayers. Due to its amphiphilic character and high lipophilicity, CP55,940 is expected to preferentially partition into this heterogeneous membrane environment rather than remain in the surrounding aqueous phase. Adapted from ... insérer ref depuis #link("https://phys.libretexts.org/Courses/University_of_California_Davis/Biophysics_241%3A_Membrane_Biology/07%3A_Computational_Characterization_of_Membranes/7.01%3A_Mathematical_Continuum_Descriptions_of_Membranes")[ce lien.]],
)<fig-lipid-in-bilayer>

The nomenclature of phospholipids reflects this structural organization. Species are typically designated by a four-letter code in which the first two letters indicate the acyl chains, while the last two specify the headgroup. For instance, POPC is for _1-palmitoyl-2-oleoyl-sn-glycero-3-phosphocholine_, while SDPS denotes _1-stearoyl-2-docosahexaenoyl-sn-glycero-3-phospho-L-serine_.

Headgroups vary in size, charge distribution and hydrogen-bonding capability, thereby defining the interfacial character of the membrane @kim_decoding_2026. These variations impose distinct geometric constraints at the molecular level, which propagate to the collective organization of the bilayer. _Phosphatidylcholines_ (PC headgroup) exhibit an approximately cylindrical geometry favoring lamellar structures , whereas smaller headgroups such as _phosphatidylethanolamine_ (PE) introduce packing asymmetry and curvature stress.

Beneath this interfacial layer lies the hydrophobic core, mainly determined by the composition and chemical structure of acyl chains, also known as fatty acids @ali_review_2023. Chain length and degree of unsaturation constitute the two primary levers to modulate the core. For example, increasing unsaturation enhances conformational flexibility, _i.e._ _cis_ double bonds introduce kinks that disrupt tight packing, hence reduce chain order and increase membrane fluidity. Acyl chains are also commonly described using a compact notation. In a glycerophospholipid, the two chains are usually referred to as sn--1 and sn--2, corresponding to their position on the glycerol backbone. Another common notation specifies the number of carbon atoms and the number of double bonds in each chain. For example, DPPC contains two saturated 16--carbon chains and can therefore be written as 16:0/16:0, whereas a polyunsaturated chain containing 20 carbons and four double bonds would be denoted 20:4.



Cell membranes also contain other essential lipids such as sterols and sphingomyelins. Among sterols, cholesterol plays a role in regulating membrane organization, fluidity and structural stability. Through their collective interactions, these different lipid species give rise to distinct membrane phase states. The phase diagram shown in @fig-phase-coexistence-cholesterol corresponds to a model membrane composed of DPPC and cholesterol. The horizontal axis represents the cholesterol mole fraction, _i.e._ the proportion of cholesterol molecules relative to the total number of lipid molecules in the membrane mixture, while the vertical axis corresponds to temperature. Depending on these two parameters, the membrane may adopt different physical states, including the gel phase ($L_beta$), the liquid--disordered phase ($L_alpha$, also commonly denoted $L_d$), and the liquid--ordered phase ($L_o$).

The gel phase ($L_beta$) is a highly ordered state in which lipid acyl chains are tightly packed, with reduced lateral mobility, resulting in a relatively rigid membrane. In contrast, the liquid--disordered phase ($L_alpha$ or $L_d$) is characterized by lower chain ordering, enhanced conformational flexibility and increased lateral diffusion. The liquid--ordered phase ($L_o$), typically found in cholesterol--rich membranes, combines features of both regimes by maintaining relatively ordered acyl chains while preserving substantial lipid mobility.


#figure(
    image("rsrc/phase-coexistence-cholesterol-with-annotations.jpeg", width:75%),
    caption: [Phase diagram of DPPC-cholesterol mixture as a function of temperature. \ Adapted from @marsh_liquid-ordered_2010. $copyright$ Elsevier (2010), reproduced with permission.#footnote[License number n°_6241360511955_]
    ],
)<fig-phase-coexistence-cholesterol>

Broad coexistence regions also appear in the diagram, such as $L_alpha + L_o$ or $L_beta + L_o$, indicating that different phases may coexist within the same membrane system depending on cholesterol concentration and temperature. Such coexistence reflects the heterogeneous nature of multicomponent membranes, in which local lipid organization and dynamics strongly depend on composition and thermodynamic conditions. Although phase equilibria are temperature--dependent, physiological conditions typically constrain this parameter within a narrow range.


In multicomponent systems, compositional heterogeneity may emerge at larger length scales. Lipid--lipid interactions between different species can drive partial lateral demixing @heberle_phase_2011 @allemand_etude_2024, leading to the formation of distinct domains within the same bilayer. Often discussed in the context of lipids rafts, this mesoscale structure reflects the competition between entropy, which favors mixing, and enthalpy, which favors lipid--lipid associations, and results in regions exhibiting various mechanical properties.

== Ligand–membrane coupling

While lipophilicity is often invoked to rationalize membrane affinity, a single partition coefficient (logP) cannot fully describe the complexity of ligand insertion into lipid bilayers, even though it is true that most CB1 ligands exhibit relatively high logP values as shown in @table-ligands-logp. One reason is that the experimental determination of logP typically relies on octanol--water partitioning, a simplified system that lacks the headgroup region --- which defines a chemically distinct interfacial environment.


#figure(
  table(
    columns: (auto, auto, auto),
    align: (left, left, center, center, center),
    stroke: (x, y) => if y == 0 { 
      (bottom: 1pt + black) 
    } else if y == 6 { 
      (top: 1pt + black) 
    } else { 
      (bottom: 0.5pt + gray.lighten(50%))
    },
    
    [*Ligand*], [*Class*], [*logP*],

    [CP55,940], [CB1 agonist], [6.1],
      [WIN55.212-2], [CB1 agonist], [4.4],
    [SR141716A  ], [CB1 antagonist / inverse agonist], [6.5],
      [$Delta$9-THC], [Major phytocannabinoid], [7.0],
    [2-AG], [Endocannabinoid], [5.3],
  ),
    caption: [Octanol/water partition coefficients (logP) of representative cannabinoid ligands. It highlights lipophilic nature of CB1 ligands.  For comparison, glucose exhibits a logP of approximately −2.6. All values were retrieved from PubChem.],
) <table-ligands-logp>


Another limitation is that logP constitutes a purely thermodynamic descriptor and therefore provides little insight into the microscopic mechanism of insertion. It does not inform on whether a ligand preferentially enters through hydrophobic regions, whether it should reorient upon insertion, or how it organizes once embedded within the bilayer. Generally, it is advised to compute potential of means force (PMFs --- that is, free--energy profiles evaluated along a chosen reaction coordinate --- if one seeks better descriptions. PMFs provide access to the energetic cost associated with membrane entry, identify possible interfacial minima and reveal insertion barriers that could not be inferred from a global partition coefficient alone.

From this perspective, the membrane can be treated as an energy landscape experienced by the ligand. While such an approach is necessary to quantify insertion and identify potential barriers, it remains a reduced description of the interaction.  The question arises: what is the physical nature of this interaction? A first level of consideration is steric. Much like inclusions in liquid crystals, an inserted ligand can be expected to behave as a local defect, perturbing lipid packing and altering the orientational order of neighboring acyl chains. Additional mechanical effects may also emerge; the ligand may locally displace lipids upon insertion, generating curvature stress or elastic deformation of the surrounding.

Chemical and electrostatic contributions must also be considered. The membrane interface is characterized by a certain distribution of charges and dipoles, and screening effects are not necessarily uniform across the interfacial region. From a physical standpoint, the bilayer constitutes an electromagnetic environment, within which local interactions may further modulate ligand behavior.

Within this framework, CP55,940 emerges as a particularly relevant model ligand for CB1. Beyond its established pharmacological profile @qureshi_identification_1998 @kimura_location_2009 @tian_interaction_2011  as a potent CB1 agonist, it presents physicochemical characteristics that make it especially suitable for investigating ligand–-membrane coupling. It exhibits a relatively high partition coefficient, consistent with strong membrane affinity. Its molecular architecture combines an aromatic core and a hydrophobic aliphatic moiety, favoring insertion toward the bilayer interior, with additional polar functional groups capable of interacting with interfacial regions. Such amphiphilic balance makes it structurally compatible with prolonged residence within a bilayer while maintaining the ability to sample different insertion depths and orientations. It is therefore reasonable to treat CP55,940 as the molecular probe it has effectively become within the CB1 literature.


== Objectives

The present work seeks to characterize how ligand–membrane coupling evolves as a function of lipid composition, in the specific context of CB1 ligands.

We aim, on the one hand, to quantify how ligand insertion perturbs the local structural organization of the bilayer. On the other hand, we examine how the membrane itself constrains and modulates ligand behavior, in a setting where the bilayer may constitute a privileged access pathway to CB1. This study is therefore deliberately positioned upstream of explicit receptor simulations.

To address these questions, we perform molecular dynamics simulations at different level of resolutions. First, relying on all--atom simulations, we aim at characterizing ligand insertion and local ordering at high structural details -- being sensitive to fine structural rearrangements. These simulations are conducted in compositionally simple membranes, within well--identified phase states, in order to isolate elementary physicochemical mechanisms.

We then extend the analysis to a coarse--grained level and to larger systems and longer timescales. This allows us to explore compositional effects at a broader scale and to assess whether local trends identified at the atomistic level persist in more complex membrane environments.

In particular, coarse--grained models make it possible to move beyond idealized binary mixtures and incorporate lipid compositions inspired by experimental lipidomics data. This is especially relevant for investigating variations in PUFAs content, whose imbalance has been reported in pathological contexts.

Accordingly, our main analytical tools consist of established membrane descriptors: membrane thickness, acyl chain order parameters, density profiles, PMFs, hydration profiles ... These indicators provide complementary structural and thermodynamic information and will be introduced and discussed systematically throughout the study.  In line with this approach, we rely on a single ligand -- CP55,940 -- used as a probe in order to isolate membranotropic effects from ligand-specific variability.

Fundamentally, this work is guided by the idea that membrane composition must be regarded as an essential variable rather than a passive background. If the coupling is sensitive  to lipid organization, then any variations in acyl chain saturation, sterol content, or PUFAs balance may alter drug behavior in ways that cannot be captured by protein affinity alone. The broader perspective of this research is to eventually clarify to what extent the membrane itself participates in shaping pharmacological outcomes ; however, our current study remains focused on the mechanics of coupling.

= Methods (3-4 pages)

== All--atom molecular dynamics

=== Membrane compositions, system preparation

All--atom membrane systems were, for fluid systems, constructed using the CHARMM--GUI membrane builder @lee_charmm-gui_2019. Gel-like membranes were built by hand from a SLipids pre-equilibrated patch#footnote[#link("http://www.fos.su.se/~sasha/SLipids/Downloads.html")]. Symmetric bilayers composed of 100 lipids per leaflet were generated under periodic boundary conditions, resulting in lamellar multilayer systems separated by aqueous slabs.

Two reference phospholipids were primarily considered in order to explore distinct membrane physical states. DOPC bilayers were used to represent a fluid liquid--disordered phase at physiological temperature, while DPPC membranes were simulated at 25°C, a temperature well below the main phase transition temperature of DPPC ($tilde 41$°C). This ensures that the membrane remains in a stable gel-like phase during the simulations and avoids the strong fluctuations associated with the transition regime. Working with these two systems allows us to contrast ligand behavior in environments characterized by markedly different packing and chain ordering properties.

In addition to these reference membranes, compositional perturbations were introduced by partially substituting the host lipids with polyunsaturated species. In practice, 10 % of the lipids were replaced by either SAPC ($omega$--6) or SDPC ($omega$--3), leading to six distinct membrane compositions in total. These substitutions introduce highly unsaturated acyl chains into otherwise well-defined bilayers and allow us to probe the influence of polyunsaturated lipids on ligand–membrane interactions.

Due to the planar geometry of the bilayer and the use of periodic boundary conditions, the simulated systems naturally adopt a stacked lamellar configuration. To avoid interactions between periodic images of adjacent membranes, a sufficiently large aqueous slab was introduced, resulting in a hydration level of approximately 45 water molecules per lipid. Sodium and chloride ions were added to reproduce an isotonic salt concentration (0.15 M NaCl) representative of physiological conditions.

System preparation followed the standard equilibration procedure provided by CHARMM--GUI. After energy minimization, a restrained NVT equilibration was performed for 500 ps, followed by a restrained NPT equilibration of 1 ns using Berendsen pressure coupling. The production equilibration runs were then performed for 100–300 ns, depending on membrane composition, to allow the bilayers to reach equilibrium before further analysis. This was especially important for gel-phase membranes, which exhibit slower lipid dynamics and therefore require longer equilibration times.


The ligand CP55,940 was introduced at concentrations reaching up to 10 mol% relative to the lipid content, after equilibration of membranes. To ease spontaneous insertion while avoiding artificial aggregation in the aqueous phase, ligand molecules were initially positioned close to the membrane surface. A pulling restraint along the membrane normal was applied during the early stages of equilibration in order to keep the ligands near the bilayer interface. After ligand insertion, an additional system relaxation step was performed. The systems were first subjected to energy minimization in order to remove possible steric clashes introduced during ligand placement. A short equilibration stage was then carried out before starting the production simulations.

=== Force field and simulation parameters

All--atom molecular dynamics simulations were performed using GROMACS 2018.2. Interactions were described using the CHARMM36m force field, which provides a well-established parametrization for lipid membranes and is widely used for phospholipid bilayer simulations @yu_update_2020.

Alternative membrane force fields exist, including so-called Berger model for lipids. However, CHARMM36m is known to correctly treat polar functional groups such as hydroxyl (-OH) moieties, which are relevant for describing ligand--membrane interactions involving hydrogen bonding at the membrane interface.

Ligand parameters for CP55,940 were generated using CGenFF, through the ligand reader & modeler module of CHARMM-GUI @kim_charmm-gui_2017. Water molecules were represented using the TIP3P model, consistent with the CHARMM parametrization. This model is commonly employed in membrane simulations and remains computationally efficient compared to more complex water models due to its lower number of degrees of freedom.

The equations of motion were integrated using a 2 fs timestep, with all bonds involving hydrogen atoms constrained using the LINCS algorithm. Long-range electrostatic interactions were computed using the particle mesh Ewald (PME) method, with a real-space cutoff of 12$angstrom$. The same cutoff was applied to short-range van der Waals interactions.

Temperature was controlled using a Nosé–Hoover thermostat, while pressure was maintained using a Parrinello--Rahman barostat with semi--isotropic pressure coupling, allowing independent fluctuations in the membrane plane and along the bilayer normal. The pressure coupling time constant was set to 5 ps.

=== Umbrella sampling and PMF calculations

*NOTES* Vérifier les valeurs des constantes dans le dernier paragraphe.

To characterize ligand insertion beyond the simple partition coefficient, we considered potentials of mean force along a chosen reaction coordinate. In the present case, this coordinate was defined as the projection of the ligand center of mass along the membrane normal (z--axis), which provides a natural description of the insertion process.

From statistical mechanics, the PMF corresponds to a free--energy profile obtained by projecting the phase space distribution onto this reduced reaction coordinate. If $x$ denotes a microscopic configuration of the system, and if $U(x)$ is its associated potential energy, the canonical probability distribution is given by the Boltzmann law,

$
    P(x) = frac(1,Z) e^(- beta U(x))
$

where $beta = 1 \/k_B T$ and $Z$ is the partition function. Then, the probability associated with a given value of the reaction coordinate $xi$ is obtained by integrating out all remaining degrees of freedom, yielding,

$
    P( xi ) = frac(1,Z) integral dif x  e^(- beta U(x)) delta ( xi - xi(x) )
$

with $delta$ the Dirac distribution. Finally, the corresponding free--energy profile is defined, up to an additive constant, as

$
    F(xi) = - k_B T ln P( xi ) + #text[constant]
$

Broadly speaking, this quantity can be interpreted as an effective free--energy obtained after averaging over all microscopic configurations compatible with a given position of the ligand along the membrane normal.

In that sense, the free--energy profile can be reconstructed by varying the reaction coordinate of the ligand and, at each fixed position, estimating the associated probability distribution while allowing the ligand to explore the remaining degrees of freedom. Repeating this procedure over a series of overlapping windows gives access to the full profile. This procedure is known as umbrella sampling, and the ligand is maintained around a given value of the reaction coordinate by means of a harmonic biasing potential.

In practice, initial configurations for these windows were generated using _steered molecular dynamics_ (SMD). After equilibration of the membrane--ligand system, the ligand was gradually pulled along the membrane normal, starting from the bulk aqueous phase toward the bilayer center.

Then, 35 configurations were extracted along this trajectory and then used as starting points for the umbrella sampling simulations, of which each was running for 100ns. The distributions obtained in each window were subsequently combined using the weighted histogram analysis method (WHAM) in order to reconstruct the unbiased PMF, since the harmonic potential introduces a bias.

In the present work, PMF calculations were restricted to DOPC membranes (64 lipids per leaflet) using GROMACS 2026.1. This choice was motivated by their fluid nature, which ensures sufficient molecular mobility and facilitates convergence of the free--energy profile along the chosen reaction coordinate. During steered molecular dynamics, the ligand was pulled along the membrane normal using a harmonic biasing potential, with a force constant of approximately $400 #text[ kJ mol]^(-1)#text[nm]^(-2)$ and a constant pulling rate of $1 times 10^(-4) #text[ nm ps]^(-1)$. 

=== Observables

We characterized the structural and thermodynamic properties of the membrane using a set of standard observables, commonly employed in the field, probing the global state of the membrane and its local response to ligand insertion.

The first observable is the so-called area per lipid (APL), defined as the average surface occupied by a lipid in the membrane plane. APL is particularly sensitive to membrane composition and phase state, and provides a direct measure of lipid packing in a given leaflet. It also serves as a practical indicator of equilibration, as reference values for pure DOPC and DPPC membranes are well documented in the literature @kucerka_lipid_2008. The area per lipid was computed using a Voronoi tessellation of the membrane plane lukat_aplvoro_2013. Each lipid was assigned an effective area corresponding to its Voronoi cell, constructed from the lateral positions of lipid headgroups. The APL was then obtained by averaging over all lipids within a leaflet.

The membrane thickness was measured as the average distance between the phosphate groups of the two opposing leaflets. Variations in thickness may reflect both compositional effects and asymmetry induced by local perturbations. Density profiles were evaluated by the use of histogram of atomic positions along a given axis, providing the average spatial distribution of molecular species and allowing the ligand position within the bilayer to be identified.

Hydration profiles were computed by counting the number of water molecules in the vicinity of the polar headgroup, using a distance-based cutoff, typically of the order of the order of 3.5 $angstrom$ --- usually used for studying structuring waters within GPCR. Hydration provides a measure of solvent penetration at the membrane interface and is particularly relevant for characterizing this region, where polar interactions and hydrogen bonding play a significant role.


The orientational order of lipid acyl chains was also quantified, using the deuterium order parameter. This quantity is a direct measure of chain alignements with respect to the membrane normal and is defined as,

$
    S_#text[CH] = frac(1,2) angle.l 3 cos^2 theta - 1 angle.r
$

where $theta$ is the angle between a given C-H bond vector and the normal, and where $angle.l dot angle.r$ denotes a statistical average over time and lipids of the same species. The order parameter was computed for each carbon atom along the acyl chains using gorder @bartos_gorder_2025, resulting in a position-dependent profile that reflects the variation of chain ordering from the headgroup region to the bilayer core. It is often understood that a higher value corresponds to a more rigid (more ordered) system, whereas values closer to zero indicate a more fluid system. However, this interpretation should be treated with caution, since the parameter only reflects an angular measurement.

Beyond these observables, molecular dynamics simulations can still be viewed as _in silico_ experiments#footnote[_Unfortunately, “simulation” has become increasingly misused to mean nothing more than “calculation.”_ -- William L. Jorgensen @jorgensen_foundations_2013] and the trajectories provides additional qualitative insight into ligand behavior, such as insertion pathways or fine details of molecular arrangements.

== Coarse-grained simulations


=== Martini 3 force field and ligand parametrization


Coarse--grained molecular dynamics was employed to study ligand--membrane coupling in lipid compositions of increased biological realism. While all--atom simulations provide detailed molecular information, they remain limited in terms of accessible system size and simulation timescale. These limitations become particularly important when considering lipidomic data, which may contain a large number of distinct lipid species, some of them representing only a few percent of the total membrane content. Moreover, several phenomena, including lateral lipid redistribution and partial demixing, occur on spatial and temporal scales that remain difficult to access using all--atom models.

To address these limitations, we employed the MARTINI3 (M3) @souza_martini_2021  coarse--grained force field, in which several atoms are represented by a single interaction site. This reduction in resolution considerably decreases the computational cost of the simulations, allowing larger membrane patches and longer trajectories to be explored.

A large fraction of the lipid species required to reproduce the target lipidomic compositions is already available within the M3 ecosystem @hilpert_facilitating_2023. However, the parametrization of the ligand itself remains a critical step. In the present work, CP55,940 was coarse--grained using the Auto--MartiniM3 @szczuka_fast_2026 tool, which provides an automated starting point for the construction of M3 models of small molecules. The availability of Auto--MartiniM3, together with the extensive documentation and validation studies accompanying M3, constituted an additional motivation for selecting this force field. Starting from the atomistic structure of CP55,940, Auto--MartiniM3 generated an initial mapping and set of interaction parameters, illustrated in *fig*.

*METTRE ICI UNE FIGURE À GAUCHE DU MAPPING, À DROITE DES PMF*

Because automated procedures may not fully reproduce the properties of a given molecule, additional validation steps were performed. In particular, PMF calculations were carried out for the coarse--grained ligand and systematically compared with the atomistic counterpart. The resulting model was judged sufficiently accurate to reproduce the main insertion features of CP55,940 but perfect quantitative agreement cannot be expected. The remaining discrepancies will be discussed in following sections.

=== Membrane composition

To move from simplified binary mixtures to more complex models, we constructed a membrane compositions inspired by lipidomics analysis of the synaptic junction @borgmeyer_multiomics_2021. Rather than attempting to reproduce the complete lipidome, which contains a very large number of molecular species, we selected the fifteen most abundant lipid species identified in these datasets. Together, these species account for approximately 75% of the total membrane composition.


#figure(
  grid(
    columns: (auto, 1fr),
    gutter: 1em,
    align: (center + horizon, center + horizon),

    text(size: 10pt)[
      #table(
        columns: (auto, auto, auto, auto, auto),
        align: (left, left, right, right, right),
        stroke: (x, y) => if y == 0 {
          (bottom: 1pt + black)
        } else if y == 16 {
          (top: 1pt + black)
        } else {
          (bottom: 0.1pt + gray)
        },

        [*Species*], [*Structure*], [*Outer*], [*Inner*], [*Total*],

        [CHOL], [Cholesterol], [923], [878], [1801],
        [POPC], [PC 16:0/18:1], [609], [60], [669],
        [DPPC], [PC 16:0/16:0], [344], [34], [378],
        [PAPC], [PC 16:0/20:4], [118], [14], [132],
        [SOPC], [PC 18:0/18:1], [97], [12], [109],
        [SAPC], [PC 18:0/20:4], [97], [12], [109],
        [PSPC], [PC 16:0/18:0], [74], [9], [83],
        [PDPC], [PC 16:0/22:6], [51], [7], [58],
        [SAPE], [PE 18:0/20:4], [86], [340], [426],
        [SDPE], [PE 18:0/22:6], [54], [216], [270],
        [SDPS], [PS 18:0/22:6], [0], [424], [424],
        [SAPI], [PI 18:0/20:4], [0], [293], [293],
        [ODLE], [PE-O 18:1/18:1], [0], [195], [195],
        [SSM],  [SM 18:1/18:0], [103], [0], [103],
        [SCER], [Cer 18:1/18:0], [51], [0], [51],

        [*Total*], [], [*2607*], [*2494*], [*5101*],
      )
    ],

    image("rsrc/fig-piechart-synaptic.png", width: 105%),
  ),
    caption: [Lipid composition of the reference synaptic membrane model. The fifteen most abundant lipid species (~75% of the experimental lipidome) were retained while preserving leaflet asymmetry. The pie chart shows the corresponding distribution of lipid classes.],
)<fig-realistic-composition>



Particular attention was paid to preserving the asymmetric organization of the membrane. Lipids known to be enriched in the outer leaflet, such as sphingomyelins and ceramides, were assigned to the extracellular side, whereas phosphatidylserines, phosphatidylinositols and plasmalogens were concentrated in the inner leaflet. The resulting membrane composition is reported in @fig-realistic-composition, with the corresponding distribution of lipid families summarized in a pie chart.

In addition to this reference membrane, a second composition was constructed to study the role of depletion in PUFAs. Experimental lipidomics studies have reported reduction in both $omega$--3 and $omega$--6 lipid species under pathological conditions @le_analysis_2023 @frajerman_lipides_2020.


To reproduce this trend, we adopted a simplified depletion strategy. All polyunsaturated acyl  chains, irrespective of their original degree of unsaturation, were systematically replaced by monounsaturated 18:1 chains. For instance, lipids containing arachidonic acid (20:4) or decosahexaenoic acid (22:6) were converted to the corresponding 18:1 analogues whenever available in the MARTINI 3 lipid library. Thus, SAPE (18:0/20:4) and SDPE (18:0/22:6) were replaced by SOPE (18:0/18:1), while SDPS (18:0/22:6) was replaced by SOPS (18:0/18:1).

In a few cases, no direct monounsaturated counterpart was available. The replacement was then performed using the closest lipid species within the M3 library while preserving the headgroup chemistry. For example, SAPI (18:0/20:4) was replaced by POPI (16:0/18:1), as no SOPI model was available. A similar approach was applied to the plasmalogen fraction.

This procedure preserves the overall distribution of lipid headgroups, and the asymmetry between leaflets while strongly reducing the abundance of $omega$--3 and $omega$--6 chains. The resulting membrane, hereby reported in @table-depleted-composition, should therefore be viewed not as a quantitative reconstruction of a specific pathological state, but as a limiting model of PUFA depletion.

#figure(
    table(
  columns: (auto, auto, auto, auto, auto),
  align: (left, left, right, right, right),
        stroke: (x, y) => if y == 0 { (bottom: 1pt + black) } else if y == 16 { (top: 1pt + black) } else { (bottom: 0.1pt + gray)},
  
 
  [*Species*], [*Structure*], [*Outer*], [*Inner*], [*Total*],

  [CHOL], [Cholesterol], [923], [878], [1801],
  [POPC], [PC 16:0/18:1], [778], [169], [947],
  [DPPC], [PC 16:0/16:0], [344], [34], [378],
  [SOPC], [PC 18:0/18:1], [194], [23], [217],
  [PSPC], [PC 16:0/18:0], [74], [9], [83],
  [SOPE], [PE 18:0/18:1], [139], [556], [695],
  [SOPS], [PS 18:0/18:1], [0], [424], [424],
  [POPI], [PI 16:0/18:1], [0], [293], [293],
  [DOLE], [PE-O 18:1/18:1], [0], [195], [195],
  [SSM],  [SM 18:1/18:0], [102], [0], [102],
  [SCER], [Cer 18:1/18:0], [51], [0], [51],
  
  [*Total*], [], [*2604*], [*2581*], [*5185*],
    ),
    caption: [Simplified $omega$--3/$omega$--6 depleted membrane composition.],
)<table-depleted-composition>





=== Simulation protocol

*NOTES à réécrire un peu, mais garder court. Pulling ?*

Coarse--grained membrane systems were constructed using the CHARMM–GUI MARTINI Maker @qi_charmm-gui_2015. After construction, the systems were subjected to the standard equilibration protocol generated by CHARMM--GUI, consisting of successive energy minimization and restrained equilibration steps.

Production simulations were subsequently performed using GROMACS 2026.1 in the NPT ensemble under periodic boundary conditions. Temperature was maintained at 310.15 K using the velocity--rescaling thermostat, while pressure was controlled semi--isotropically using the C--rescale barostat. Electrostatic interactions were treated using the reaction–field approach with a dielectric constant of 15. A timestep of 20 fs was employed throughout the production runs. All coarse--grained production trajectories were propagated for 2 μs.

CP55,940 molecules were then introduced at a concentration of 10 mol%, corresponding approximately to one ligand molecule for every ten lipids. Ligands were initially distributed on both sides of the membrane and the systems were subsequently equilibrated. Production simulations were then extended for an additional 2 μs in order to characterize ligand insertion and membrane reorganization processes.


== Computational performances
- Jean-Zay, Mesocentre
- Taille des systemes
- ns/day performance
- GPU/CPU usage 
- coût total en temps de calcul
- Comment être reproductible? les replica

=  Atomistic results: lipid dependent ligand-membrane coupling (5-6 pages)

== Insertion profiles, orientational behaviors

In order to characterize the location of CP55,940 within the bilayer, density profiles were computed along the membrane normal for the different molecular groups --- composing the ligand, and the lipids.



#figure(
    image("rsrc/fig-insertion-profile/density-profile.png", width:80%),
    caption: [Density profiles along the membrane normal for CP55,940 moieties and representative lipid groups in (a) DOPC, (b) DPPC, (c) DPPC+SAPC (9:1), (d) DPPC+SDPC (9:1) membranes. The cyclohexanol, phenol and alkyl--chain profiles correspond to the ligand, and corresponding densities are multiplied by 10 for better visualization.],
)<fig-insertion-profile>

As shown in @fig-insertion-profile, in pure DOPC layer (a), the ligand displays a preferential location within the interfacial region of the membrane, as its aromatic moieties remain predominantly localized near the glycerol backbone of the lipids. The aliphatic chain penetrates a bit deeper into the membrane -- it tends to align with the surrounding chains, instead of completely folding on itself. This is expected for an amphiphilic insertion mode. We also observed a symmetric behavior upon enrichment with SAPC or SDPC lipids, suggesting that ligand localization is well preserved in these more disordered membranes.

A different behavior is reported in DPPC--containing systems (b-d). In contrast with the simple interfacial distribution in DOPC, the ligand density profiles exhibit multiple maxima extending deeper into the membrane. In particular, all the moieties display a bimodal distribution, with one population remaining close to glycerol and another penetrating significantly further into the core. This may be due to the coexistence of several metastable insertion states, possibly arising from slow relaxation dynamics imposed by more the ordered environment, leading to incomplete sampling on molecular dynamics timescales and contributing to the observed bimodal distribution.

@fig-ring-angles illustrates the orientational distributions of CP55,940 aromatic core relative to the membrane normal. Fluid DOPC membrane (b) exhibits a relatively broad distribution centered around intermediate tilt angles (~35--55°). In this configuration, the aromatic core remains close to the polar heads, allowing the hydroxyl groups to act as interfacial anchors in a hydrated region of the membrane. 

#figure(
    image("rsrc/fig-ring-angles/fig-ring-angles-with-scheme.png", width:100%),
    caption: [Orientational distributions of the aromatic core of CP55,940 relative to the membrane normal in (b) DOPC, (c) DPPC and (d) DPPC+SDPC (9:1) membranes. \ 
(a) Schematic representation of the tilt-angle definition.],
)<fig-ring-angles>

Compared with DOPC, DPPC membranes (c-d) display less defined distributions, without a clearly preferred tilt angle, suggesting a more heterogeneous orientational landscape with multiple nearly equivalent configurations. This broader distribution may reflect a higher packing frustration and a more constrained interfacial environment, where the ligand orientation is less collectively organized and more sensitive to local membrane structure.

This interpretation is supported by @fig-tail-angles, where we report orientational distributions of the alkyl chain of the ligand. The DOPC membrane (b) shows an almost isotropic distribution, with no preferential tilt angle over a wide angular range. This behavior suggests a highly fluid and permissive environment, where the ligand retains orientational freedom and can explore multiple configurations. In contrast, the DPPC system (c) display a marked low-angle preference (~20 °), indicative of a more tightly packed surrounding that constrains the alkyl chain. An intermediate behavior is observed for DPPC+SDPC (d), supporting the idea that lipid disorder progressively restores flexibility and reduce confinement effects.


#figure(
    image("rsrc/fig-tails-angles/fig-tail-angles-with-scheme.png", width:100%),
    caption: [Orientational distributions of the alkyl chain of CP55,940 relative to the membrane normal in (b) DOPC, (c) DPPC and (d) DPPC+SDPC (9:1) membranes. \ 
(a) Schematic representation of the tilt-angle definition.],
)<fig-tail-angles>


Taken together, these observations suggest that the insertion behavior of CP55,940 results from a balance between chemical affinity for the membrane interface and steric constraints imposed by the lipid matrix. In fluid condition, the ligand appears to be primarily guided by favorable chemical interactions, as the hydroxyl groups remain anchored near the hydrated interfacial region while the rest of the molecule retains conformational freedom. This picture is consistent with previous experimental NMR results obtained for CP55,940 in POPC membranes @kimura_location_2009, a fluid phosphatidylcholine bilayer close to DOPC, where the ligand was also reported to adopt an interfacial insertion mode. It contrasts with ordered membranes, where DPPC imposes stronger packing constraints, leading to broader insertion distributions and less well--defined orientational preferences. In these systems, local membrane organization likely competes with the intrinsic amphiphilic character of the ligand in determining its insertion mode. The introduction of unsaturations progressively relaxes these constraints, partially restoring the configurational flexibility and interfacial behavior.


// #figure(
//     image("rsrc/fig-illustration-placement/ligand-positioned.png", width:80%),
//     caption: [Representative snapshot of CP55,940 inserted in a pure DOPC bilayer.\ The hydroxyl groups (light red) remain located near the hydrated interface, while the tail is folding.],
// )<fig-ligand-positioned>

== Free energy profiles (PMF)



#figure(
    image("rsrc/fig-pmf-aa/pmf.png", width:80%),
    caption: [Potential of mean force computed for a CP55,940 ligand approaching a DOPC membrane in all--atom. An indicative illustration is set in the background to visualize the leaflet.],
)<fig-pmf-aa>

Having established from insertion profiles that CP55,940 adopts preferentially an interfacial insertion mode in fluid DOPC membranes, we next quantified the energetic cost associated to it. The free--energy profile shown in @fig-pmf-aa was reconstructed by taking the aqueous phase as the reference state.

Starting from bulk water, the PMF rapidly decreases as the ligand approaches the interface, indicating a thermodynamic driving force for membrane insertion, confirming that the membrane constitutes a favorable environment for the ligand. Interestingly, a small energy barrier is observed close to the water-lipid interface ; it likely corresponds to the energetic cost associated with crossing the phosphate headgroup region and locally perturbing lipid packing in order to access the hydrophobic core of the bilayer.

Once this barrier is crossed, the free--energy decreases toward a pronounced minimum located inside the membrane, in good agreement with the density profiles and orientational analyses. Finally, the PMF rises again when approaching the bilayer center, usually depleted in lipids. In practice, this free--energy increase should act as a barrier against spontaneous flip--flop events on accessible simulation timescales.

== Structural and mechanical response

We next examined how the membrane itself responds to ligand incorporation. To this end, we analyzed the area per lipid, the deuterium order parameter and the local hydration environment of the glycerol, which together should provide complementary information on membrane packing, ordering and interfacial organization. In mixed membranes, order parameter analyses were restricted to the host lipids (DOPC or DPPC). Indeed, the relatively small number of SAPC or SDPC molecules in the simulated patches did not allow statistically robust profiles to be extracted for the polyunsaturated species themselves.

#figure(
    image("rsrc/fig-apl/apl.png", width:80%),
    caption: [Area per lipid (APL) measured for DOPC--based and DPPC--based membranes in the absence (control) and presence of CP55,940. For mixed systems, the reported values correspond to the average area per host lipid within the membrane plane.],
)<fig-apl>




The first important thing to note is that the control systems reproduce the expected physical trends associated with membrane composition and phase state. As shown in @fig-apl and @fig-sch-dppc, DPPC--based membranes display smaller APL values together with substantially higher order parameters than DOPC systems (@fig-sch-dopc), reflecting the tightly packed and more ordered nature of the gel phase. DPPC membranes enriched with SAPC or SDPC display though slightly higher order parameters than pure DPPC. At first sight, this may appear counterintuitive, since the introduction of unsaturated chains is generally associated with increased disorder. However, this observation should be interpreted carefully. In the gel phase, DPPC acyl chains are strongly tilted with respect to the membrane normal, while remaining very straight, as suggested by the flat--looking curve. Still, since the order parameter only probes the angle formed by C--H bonds relative to the normal, such collective tilt can artificially reduce the measured $S_#text[CH]$ despite the membrane remaining rigid. The introduction of polyunsaturated lipids likely shifts the membrane away from the gel organization toward a more fluid but still ordered state, possibly closer to a liquid--ordered regime. In this configuration, the average chain tilt relative to the membrane normal is reduced, which may contribute to the larger apparent order parameters observed here. We also noted that the profiles become more rounded and less flat, suggesting that part of the extreme packing characteristic of the gel phase is progressively lost, together with some restored fluidity. Conversely, DOPC bilayers exhibit larger APL values and lower order parameters, in agreement with their liquid--disordered nature at physiological temperature. The addition of unsaturations further shifts the systems toward more disordered configurations. Overall, these observations are consistent with the expected hierarchy between the different membrane compositions and therefore support the physical coherence of the simulated systems.



#figure(
    image("rsrc/fig-order-parameter/dopc-order.png", width:112%),
    caption: [Deuterium order parameter profiles ($S_#text[CH]$) computed for DOPC acyl chains in pure DOPC, DOPC+SAPC (9:1) and DOPC+SDPC (9:1) membranes, in the absence (control) and presence of CP55,940. The upper and lower panels correspond respectively to the sn--1 and sn--2 chains of DOPC. Order parameters were computed only for the host DOPC lipids.],
)<fig-sch-dopc>

In this background, the effect of CP55,940 appears to be dependent on the initial membrane organization. In all systems, ligand insertion induces an increase in area per lipid, indicating a global lateral expansion --- depacking --- of the bilayer. This effect remains moderate in fluid DOPC membranes but becomes more pronounced in DPPC systems. From a physical perspective, this behavior is compatible with the ligand acting as a local inclusion within the membrane, perturbing the packing and generating additional free volume around the insertion region. This expansion is not systematically accompanied by a decrease in chain ordering. In DOPC membranes, the deuterium parameter profiles remain almost unchanged upon ligand insertion, suggesting that the fluid bilayer can accommodate the perturbation without major structural reorganization. By contrast, DPPC--based membranes display a noticeable increase in chain ordering in the presence of the ligand, which we interpret as a trace of packing rearrangement around the ligand, where the membrane reorganizes in order to compensate for the perturbation introduced by insertion.

Hydration profiles further support the observed differences between the various membrane compositions. As represented in @fig-hydration, DOPC--based membranes exhibit systematically larger hydration levels around the phosphate group than DPPC systems. The introduction of polyunsaturated lipids increases hydration in both membrane families, an effect that is particularly pronounced in DPPC systems. This behavior is coherent with the increase in area per lipid and the partial loss of the highly packed gel organization discussed previously. The insertion of unsaturated chains likely introduces local packing defects and additional free volume, thereby facilitating water penetration toward the interfacial region.

#figure(
    image("rsrc/fig-order-parameter/dppc-order.png", width:112%),
    caption: [Deuterium order parameter profiles ($S_#text[CH]$) computed for DPPC acyl chains in pure DPPC, DPPC+SAPC (9:1) and DPPC+SDPC (9:1) membranes, for both control systems and membranes containing CP55,940. The upper and lower panels correspond respectively to the sn--1 and sn--2 chains of DPPC. Order parameters were evaluated only on the host DPPC lipids.],
)<fig-sch-dppc>


The presence of CP55,940 also shifts the distributions toward larger hydration values. This effect remains moderate in fluid DOPC membranes but becomes much more visible in DPPC systems. Altogether, these observations support the idea that both polyunsaturated lipids and ligand insertion contribute to relaxing the compact organization of ordered membranes and promote a more hydrated interfacial environment.

For the sake of clarity, all hydration distributions were normalized by the number of host lipids (DOPC or DPPC), allowing direct comparison between the different membrane compositions despite the presence of mixed systems.




#figure(
    image("rsrc/fig-hydration/hydration.png", width:100%),
    caption: [Hydration distributions computed around the phosphate moieties of the host lipids for (a) DOPC and DOPC+SAPC (9:1) membranes, (b) DOPC and DOPC+SDPC (9:1) membranes, (c) DPPC and DPPC+SAPC (9:1)  membranes, and (d) DPPC and DPPC+SDPC (9:1) membranes, in the absence and presence of CP55,940. The distributions are normalized by the number of host lipids (DOPC or DPPC).],
)<fig-hydration> 


= Extension to lipidomic context: Coarse-grained results (4-5 pages)

À voir où on met le multiscale consistency. En premier j'oserais dire.

== Multiscale consistency
- Comparison between atomistics and CG results
- Conserved vs scale-dependent features
- PMF.

== Realistic membrane compositions
- w6 modulation 
- cholesterol content
- headgroups

== Lateral organisation and partitioning
- Ligand spatial distribution
- Phase preference
- Demixing, rafts, collective membrane behavior


= Discussion (4-5 pages)

== Lipid composition as a modulator of ligand-membrane coupling

== Implications for lipidomic alterations
- w6 depletion & potential pharmacological consequences
- Positioning within broader scientific landscape

== Methodological strengths and limitations
- Absence of receptor
- Sampling limitations 
- Force field consideration 

== Perspectives
- Inclusion of CB1 in future work
- Multi ligand comparison
- Ongoing collaboration with CBMN 


= Conclusion (3 pages)


#pagebreak()
#bibliography("cb1.bib")
#pagebreak()
#show: appendix

