
#import "@preview/physica:0.9.5":*


// PARAMETERS
#set page(margin: (x:25mm, y:auto), numbering : "1")
#set text(font:"Times New Roman", size:12pt)
#set heading(numbering : "1.")
#set par(justify: true)
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


#outline()

#pagebreak()
#set page(columns:1, header:[_À venir_])

= Introduction (4-5 pages)

== Biological and pharmacological context

In a highly lipophilic environment, the membrane cannot be regarded as a passive element. Being itself a lipid assembly, it inevitably becomes the primary physicochemical landscape for molecules exhibiting strong hydrophobic character.

Yet, traditional pharmacological frameworks implicitly assume that neurotransmitters diffuse through aqueous media before encountering their receptor [*ref rang & dales*]. This picture, while adequate for hydrophilic signaling molecules, becomes incomplete in the case of the endocannabinoid system (ECS) --- a central regulator of neural activity, and a major pharmacological target in neurological and metabolic disorders.

Endocannabinoids are lipid-derived molecules synthesized on demand from the hydrolysis of membrane phospholipids [*ref m/s*]. This biochemical origin confers lipophilic properties, meaning that these molecules preferentially partition into hydrophobic environments rather than the surrounding aqueous phase. Their transport, diffusion and possibly their functional interactions are therefore conditioned by the surrounding lipid membranes.

The cannabinoid receptor type 1 (CB1), one of the most abundantly expressed G protein-coupled receptors (GPCRs) in the mammalian central nervous system, is itself embedded in this membrane environment. Structural and pharmacological evidence suggests that access to its orthosteric binding pocket may occur laterally from within the bilayer rather than directly from the extracellular bulk [*ref hurst, jakowiecki*]. In this view, the plasma membrane is more than a passive scaffold: it acts as a physicochemical pre-filter that governs which ligands reach the intramembrane binding pocket, and in what local concentration and orientation. The membrane therefore precedes receptor binding in the sequence of molecular events leading to activation.

This pathway is relevant not only for endogenous cannabinoids such as anandamide and 2-arachidonoylglycerol (2--AG), but also for exogenous ligands targeting CB1 [*ref thakur*]. These include phytocannabinoids such as $Delta$9-tetrahydrocannabinol (THC), as well as synthetic compounds developed for pharmacological purposes, among which CP55,940 and WIN55.212-2 are potent agonists, and rimonabant (SR141716A) a well-known inverse agonist. Despite their structural diversity, these ligands share a pronounced lipophilic character, reflected by high partition coefficients which should strongly favor membrane partitioning prior to receptor engagement.

The membrane environment is neither uniform nor static. The presynaptic bilayer --- where CB1 is highly expressed --- is enriched in sterols, phospholipids, and sphingolipids [*ref ahrends, lauwer?*] and defines the mechanical and chemical conditions under which signaling occurs. Lipidomic analyses have revealed significant compositional alterations under pathological conditions, including depletion of $omega$--3 and $omega$--6 polyunsaturated fatty acids (PUFAs) in patients experiencing a first psychotic episode [*ref le, frajerman*]. From a biophysical standpoint, such shifts modify acyl chain order, bilayer thickness, and bending stiffness ---  parameters that directly influence ligand partitioning and mobility.

In this context, the efficacy of amphiphilic drugs cannot be reduced to their affinity for a protein target alone. Their pharmacodynamic profile emerges from a coupled interaction with the lipid environment, which defines the free-energy landscape governing insertion, orientation, and diffusion. Upon entering the bilayer, a ligand may locally perturb membrane organization, while mesoscopic mechanical constraints reciprocally restrict the energetic configurations accessible to the drug. Ligand--membrane interactions should therefore be regarded as a coupled physicochemical system rather than a secondary step preceding receptor binding. As a dynamic filter shaping when, where, and how ligands engage their targets, local bilayer properties may constitute previously underappreciated determinants of drug response and efficacy.

== Lipid membranes as physicochemical systems

Lipid membranes are not homogeneous solvents but instead complex physicochemical systems, exhibiting rich phase behavior. This complexity is mainly brought by the diversity of their molecular constituents: headgroups, acyl chain saturation, and sterol content.

The nomenclature of phospholipids reflects this structural organization. Species are typically designated by a four-letter code in which the first two letters indicate the acyl chains, while the last two specify the headgroup. For instance, POPC is for _1-palmitoyl-2-oleoyl-sn-glycero-3-phosphocholine_, while SDPS denotes _1-stearoyl-2-docosahexaenoyl-sn-glycero-3-phospho-L-serine_.

Headgroups vary in size, charge distribution and hydrogen-bonding capability, thereby defining the interfacial character of the membrane [*ref revue lipides kim & yoo*]. These variations impose distinct geometric constraints at the molecular level, which propagate to the collective organization of the bilayer. _Phosphatidylcholines_ (PC headgroup) exhibit an approximately cylindrical geometry favoring lamellar structures , whereas smaller headgroups such as _phosphatidylethanolamine_ (PE) introduce packing asymmetry and curvature stress.

Beneath this interfacial layer lies the hydrophobic core, mainly determined by the composition and chemical structure of acyl chains, also known as fatty acids [*ref revue ali*]. Chain length and degree of unsaturation constitute the two primary levers to module the core. For example, increasing unsaturation enhances conformational flexibility, _i.e._ cis double bonds introduce kinks that disrupt tight packing, hence reduce chain order and increase membrane fluidity.

Cell membranes also contain other essential lipids like sterols and sphingomyelins. The most famous member of the sterol family is cholesterol, which plays a vital role in regulating membrane fluidity and structural stability.

*INSÉRER IMAGE DIAGRAMME DE PHASE DONNÉ PAR FLORENTIN, ARTICLE*

These variations in lipid composition give rise to distinct lamellar phase states [*ref*], notably,

- the gel phase ($L_beta$), in which lipid tails are highly ordered and tightly packed, leading to reduced lateral mobility and increased membrane rigidity,
- the liquid-ordered phase ($L_o$), typically promoted by cholesterol, combining high tail order with significant lateral mobility,
- the liquid-disordered phase ($L_d$), characterized by lower chain order, increased flexibility, and enhanced lateral diffusion. 

Although phase equilibria are temperature-dependent, physiological conditions typically constrain this parameter within a narrow range.

In multicomponent systems, compositional heterogeneity may emerge at larger length scales. Lipid--lipid interactions between different species can drive partial lateral demixing [*ref heberle*], leading to the formation of distinct domains within the same bilayer. Often discussed in the context of lipid rafts, this mesoscale structure reflects the balance between entropic mixing and favorable intermolecular interactions, and results in regions exhibiting various mechanical properties.

== Ligand–membrane coupling

While lipophilicity is often invoked to rationalize membrane affinity, a single partition coefficient (logP) cannot fully describe the complexity of ligand insertion into lipid bilayers, even though it is true that most CB1 ligands exhibit relatively high logP values [*ref* si rien littérature, faire un tableau nous meme]. One reason is that the experimental determination of logP typically relies on octanol--water partitioning [*ref method*], a simplified system that lacks the headgroup region --- which defines a chemically distinct interfacial environment.

Another limitation is that logP constitutes a purely thermodynamic descriptor and therefore provides little insight into the microscopic mechanism of insertion. It does not inform on whether a ligand preferentially enters through hydrophobic regions, whether it should reorient upon insertion, or how it organizes once embedded within the bilayer. Generally, it is advised to compute potential of means force (PMFs) [*ref*] --- that is, free--energy profiles evaluated along a chosen reaction coordinate --- if one seeks better descriptions. PMFs provide access to the energetic cost associated with membrane entry, identify possible interfacial minima and reveal insertion barriers that could not be inferred from a global partition coefficient alone.

From this perspective, the membrane can be treated as an energy landscape experienced by the ligand. While such an approach is necessary to quantify insertion and identify potential barriers, it remains a reduced description of the interaction.  The question arises: what is the physical nature of this interaction? A first level of consideration is steric. Much like inclusions in liquid crystals, an inserted ligand can be expected to behave as a local defect, perturbing lipid packing and altering the orientational order of neighboring acyl chains. Additional mechanical effects may also emerge; the ligand may locally displace lipids upon insertion, generating curvature stress or elastic deformation of the surrounding [*ref*].

Chemical and electrostatic contributions must also be considered. The membrane interface is characterized by a certain distribution of charges and dipoles, and screening effects are not necessarily uniform across the interfacial region. From a physical standpoint, the bilayer constitutes an electromagnetic environment, within which local interactions may further modulate ligand behavior.

Within this framework, CP55,940 emerges as a particularly relevant model ligand for CB1. Beyond its established pharmacological profile [*ref*] as a potent CB1 agonist, it presents physicochemical characteristics that make it especially suitable for investigating ligand–-membrane coupling. It exhibits a relatively high partition coefficient, consistent with strong membrane affinity. Its molecular architecture combines an aromatic core and a hydrophobic aliphatic moiety, favoring insertion toward the bilayer interior, with additional polar functional groups capable of interacting with interfacial regions. Such amphiphilic balance makes it structurally compatible with prolonged residence within a bilayer while maintaining the ability to sample different insertion depths and orientations. It is therefore reasonable to treat CP55,940 as the molecular probe it has effectively become within the CB1 literature.


== Objectives

The present work seeks to characterize how ligand–membrane coupling evolves as a function of lipid composition, in the specific context of CB1 ligands, which are known to interact with the cellular membrane prior to receptor engagement.

We aim, on the one hand, to quantify how ligand insertion perturbs the local structural organization of the bilayer. On the other hand, we examine how the membrane itself constrains and modulates ligand behavior, in a setting where the bilayer may constitute a privileged access pathway to CB1. This study is therefore deliberately positioned upstream of explicit receptor simulations.

To address these questions, we perform molecular dynamics simulations at different level of resolutions. First, relying on all--atom simulations, we aim at characterizing ligand insertion and local ordering at high structural details -- being sensitive to fine structural rearrangements. These simulations are conducted in compositionally simple membranes, within well--identified phase states, in order to isolate elementary physicochemical mechanisms.

We then extend the analysis to a coarse--grained level and to larger systems and longer timescales. This allows us to explore compositional effects at a broader scale and to assess whether local trends identified at the atomistic level persist in more complex membrane environments.

In particular, coarse--grained models make it possible to move beyond idealized binary mixtures and incorporate lipid compositions inspired by experimental lipidomics data. This is especially relevant for investigating variations in PUFAs content, whose imbalance has been reported in pathological contexts. By doing so, we aim to connect controlled physicochemical models with membrane compositions that are pharmacologically and medically meaningful.

Accordingly, our main analytical tools consist of established membrane descriptors: membrane thickness, acyl chain order parameters, density profiles, PMFs, hydration profiles ... These indicators provide complementary structural and thermodynamic information and will be introduced and discussed systematically throughout the study.  In line with this approach, we rely on a single ligand -- CP55,940 -- used as a probe in order to isolate membranotropic effects from ligand-specific variability.

Fundamentally, this work is guided by the idea that membrane composition must be regarded as an essential variable rather than a passive background. If the coupling is sensitive  to lipid organization, then any variations in acyl chain saturation, sterol content, or PUFA balance may alter drug behavior in ways that cannot be captured by protein affinity alone. The broader perspective of this research is to eventually clarify to what extent the membrane itself participates in shaping pharmacological outcomes ; however, our current study remains focused on the mechanics of coupling.

= Methods (3-4 pages)

Justifier les choix, mais ne pas refaire la démo de cmt tout fonctionne.

== All-atom molecular dynamics 
replica ?
=== Membrane compositions, system preparation

All--atom membrane systems were constructed using the CHARMM--GUI membrane builder. Symmetric bilayers composed of 100 lipids per leaflet were generated under periodic boundary conditions, resulting in lamellar multilayer systems separated by aqueous slabs.

Two reference phospholipids were primarily considered in order to explore distinct membrane physical states. DOPC bilayers were used to represent a fluid liquid--disordered phase at physiological temperature, while DPPC membranes were simulated at 25 °C, a temperature well below the main phase transition temperature of DPPC ($tilde 314$ K). This ensures that the membrane remains in a stable gel-like phase during the simulations and avoids the strong fluctuations associated with the transition regime [*refs*]. Working with these two systems allows us to contrast ligand behavior in environments characterized by markedly different packing and chain ordering properties.

In addition to these reference membranes, compositional perturbations were introduced by partially substituting the host lipids with polyunsaturated species. In practice, 10 % of the lipids were replaced by either SAPC ($omega$--6) or SDPC ($omega$--3), leading to six distinct membrane compositions in total. These substitutions introduce highly unsaturated acyl chains into otherwise well-defined bilayers and allow us to probe the influence of polyunsaturated lipids on ligand–membrane interactions.

Due to the planar geometry of the bilayer and the use of periodic boundary conditions, the simulated systems naturally adopt a stacked lamellar configuration. To avoid interactions between periodic images of adjacent membranes, a sufficiently large aqueous slab was introduced, resulting in a hydration level of approximately 45 water molecules per lipid [*ref*]. Sodium and chloride ions were added to reproduce an isotonic salt concentration (0.15 M NaCl) representative of physiological conditions.

System preparation followed the standard equilibration procedure provided by CHARMM--GUI. After energy minimization, a restrained NVT equilibration was performed for 500 ps, followed by a restrained NPT equilibration of 1 ns using Berendsen pressure coupling. The production equilibration runs were then performed for 100–300 ns, depending on membrane composition, to allow the bilayers to reach equilibrium before further analysis. This was especially important for gel-phase membranes, which exhibit slower lipid dynamics and therefore require longer equilibration times [*ref*].


The ligand CP55,940 was introduced at concentrations reaching up to 10 mol % relative to the lipid content, after equilibration of membranes. To ease spontaneous insertion while avoiding artificial aggregation in the aqueous phase, ligand molecules were initially positioned close to the membrane surface. A pulling restraint along the membrane normal was applied during the early stages of equilibration in order to keep the ligands near the bilayer interface. After ligand insertion, an additional system relaxation step was performed. The systems were first subjected to energy minimization in order to remove possible steric clashes introduced during ligand placement. A short equilibration stage was then carried out before starting the production simulations.

=== Force field and simulation parameters

*NOTES* Il faudra sûrement revoir cette partie pour expliquer un peu mieux la construction des membranes gels.

All molecular dynamics simulations were performed using GROMACS 2018.2. Interactions were described using the CHARMM36m force field, which provides a well-established parametrization for lipid membranes and is widely used for phospholipid bilayer simulations [*ref yu2018*].

Alternative membrane force fields exist, including so-called Berger model for lipids. However, CHARMM36m is known to correctly treat polar functional groups such as hydroxyl (-OH) moieties, which are relevant for describing ligand--membrane interactions involving hydrogen bonding at the membrane interface.

Ligand parameters for CP55,940 were generated using CGenFF, through the ligand reader & modeler module of CHARMM-GUI [*ref kim2017*]. Water molecules were represented using the TIP3P model, consistent with the CHARMM parametrization. This model is commonly employed in membrane simulations and remains computationally efficient compared to more complex water models due to its lower number of degrees of freedom.

The equations of motion were integrated using a 2 fs timestep, with all bonds involving hydrogen atoms constrained using the LINCS algorithm. Long-range electrostatic interactions were treated using the particle mesh Ewald (PME) method, with a real-space cutoff of 12$angstrom$. The same cutoff was applied to short-range van der Waals interactions.

Temperature was controlled using a Nosé–Hoover thermostat, while pressure was maintained using a Parrinello--Rahman barostat with semi--isotropic pressure coupling, allowing independent fluctuations in the membrane plane and along the bilayer normal.

For gel--like membrane systems, the pressure coupling time constant was slightly relaxed from 5 to 10 in order to prevent membrane buckling, a common defect in highly ordered bilayers where lateral stresses may induce the inflate of the membrane [*ref* plein de refs].

=== Umbrella sampling and PMF calculations

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

In practice, initial configurations for these windows were generated using _steered molecular dynamics_ (SMD). After equilibration of the membrane--ligand system, the ligand was gradually pulled along the membrane normal, starting from the aqueous phase toward the bilayer center.

Configurations were extracted along this trajectory and then used as starting points for the umbrella sampling simulations. The distributions obtained in each window were subsequently combined using the weighted histogram analysis method (WHAM) in order to reconstruct the unbiased PMF, since the harmonic potential introduces a bias.

In the present work, PMF calculations were restricted to DOPC membranes. This choice was motivated by their fluid nature, which ensures sufficient molecular mobility and facilitates convergence of the free--energy profile along the chosen reaction coordinate. During steered molecular dynamics, the ligand was pulled along the membrane normal using a harmonic biasing potential, with a force constant of approximately $600 #text[ kJ mol]^(-1)#text[nm]^(-2)$ and a constant pulling rate of $1 times 10^(-4) #text[ nm ps]^(-1)$.

=== Observables

We characterized the structural and thermodynamic properties of the membrane using a set of standard observables, commonly employed in the field, probing the global state of the membrane and its local response to ligand insertion.

The first observable is the so-called area per lipid (APL), defined as the average surface occupied by a lipid in the membrane plane. APL is particularly sensitive to membrane composition and phase state, and provides a direct measure of lipid packing in a given leaflet. It also serves as a practical indicator of equilibration, as reference values for pure DOPC and DPPC membranes are well documented in the literature [*ref*]. The area per lipid (APL) was computed using a Voronoi tessellation of the membrane plane [*ref dans lipyphilic*]. Each lipid was assigned an effective area corresponding to its Voronoi cell, constructed from the lateral positions of lipid headgroups. The APL was then obtained by averaging over all lipids within a leaflet.

The membrane thickness was measured as the average distance between the phosphate groups of the two opposing leaflets. Variations in thickness may reflect both compositional effects and asymmetry induced by local perturbations. Density profiles were evaluated by the use of histogram of atomic positions along a given axis, providing the average spatial distribution of molecular species and allowing the ligand position within the bilayer to be identified.

Hydration profiles were computed by counting the number of water molecules in the vicinity of specific moieties (polar headgroups, glycerol backbone, phenol, ...), using a distance-based cutoff. This cutoff was defined from the position of the first minimum in the radial distribution function between the selected group and water, and is typically of the order of 3.5 $angstrom$ *A JUSTIFIER/MONTRER/VERIFIER*. Hydration provides a measure of solvent penetration at the membrane interface and is particularly relevant for characterizing this region, where polar interactions and hydrogen bonding play a significant role.


The orientational order of lipid acyl chains was also quantified, using the deuterium order parameter. This quantity is a direct measure of chain alignements with respect to the membrane normal and is defined as,

$
    S_#text[CD] = frac(1,2) angle.l 3 cos^2 theta - 1 angle.r
$

where $theta$ is the angle between a given C-H bond vector and the normal, and where $angle.l dot angle.r$ denotes a statistical average over time and lipids of the same species. The order parameter was computed for each carbon atom along the acyl chains, resulting in a position-dependent profile that reflects the variation of chain ordering from the headgroup region to the bilayer core.

Beyond these observables, molecular dynamics simulations can still be viewed as _in silico_ experiments#footnote[_Unfortunately, “simulation” has become increasingly misused to mean nothing more than “calculation.”_ -- William L. Jorgensen [*ref*]] and the trajectories provides additional qualitative insight into ligand behavior, such as insertion pathways or fine details of molecular arrangements.

== Coarse-grained simulations
- Martini 
- Stratégie de mapping
- S'inspirer de données de lipidomiques
- Modulation d'omega 6 et de médicament 
- Observables, validation

== Computational performances
- Taille des systemes
- ns/day performance
- GPU/CPU usage 
- coût total en temps de calcul
- Comment être reproductible? les replica

=  Atomistic results: lipid dependent ligand-membrane coupling (5-6 pages)

== Insertion, orientation
- Gel vs fluid comparison
- SAPC enrichment effects
- Headgroup dependence

== Free energy profiles (PMF)
- Energy minima 
- Energy barriers
- Membrane-dependent differences

== Structural and mechanical response
- Order parameters
- Local rigidification
- Dehydration profiles
- Thickness changes

== Interpretation of coupling
- Membrane influence on ligand positioning
- Local membrane response to insertion
- Bidirectional coupling analysis

= Extension to lipidomic context: Coarse-grained results (4-5 pages)

== Realistic membrane compositions
- w6 modulation 
- cholesterol content
- headgroups

== Lateral organisation and partitioning
- Ligand spatial distribution
- Phase preference
- Demixing, rafts, collective membrane behavior

== Multiscale consistency
- Comparison between atomistics and CG results
- Conserved vs scale-dependent features

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
#show: appendix


= Glossary

- ECS
- CB1
- GPCR
- PUFA
- affinity
- potency
- efficacy
- lipid
- omega 3, omega 6
- scaffold
