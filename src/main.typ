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

Endocannabinoids are lipid-derived molecules synthesized on demand from the hydrolysis of membrane phospholipids [*ref m/s*]. Their pronounced lipophilicity confines them primarily to the bilayer, where partitioning and lateral diffusion dominate their transport. In this configuration, ligand-receptor encounters do not occur in dilute aqueous solution, but within a structured and heterogeneous lipid matrix.

The cannabinoid receptor type 1 (CB1), one of the most abundantly expressed G protein-coupled receptors (GPCRs) in the mammalian central nervous system, is itself embedded in this membrane environment. Structural and pharmacological evidence suggests that access to its orthosteric binding pocket may occur laterally from within the bilayer rather than directly from the extracellular bulk [*ref hurst, jakowiecki*]. In this view, the plasma membrane is more than a passive scaffold: it acts as a physicochemical pre-filter that governs which ligands reach the intramembrane binding pocket, and in what local concentration and orientation. The membrane therefore precedes receptor binding in the sequence of molecular events leading to activation.

This pathway is relevant not only for endogenous cannabinoids such as anandamide and 2-arachidonoylglycerol (2--AG), but also for exogenous ligands targeting CB1 [*ref thakur*]. These include phytocannabinoids such as $Delta$9-tetrahydrocannabinol (THC), as well as synthetic compounds developed for pharmacological purposes, among which CP55,940 and WIN55.212-2 are potent agonists, and rimonabant (SR141716A) a well-known inverse agonist. Despite their structural diversity, these ligands share a pronounced lipophilic character, reflected by high partition coefficients which strongly favor membrane partitioning prior to receptor engagement.

Importantly, this membrane environment is neither uniform nor static. The presynaptic bilayer --- where CB1 is highly expressed --- is enriched in sterols, phospholipids, and sphingolipids [*ref ahrends, lauwer?*] and defines the mechanical and chemical conditions under which signaling occurs. Lipidomic analyses have revealed significant compositional alterations under pathological conditions, including depletion of $omega$--3 and $omega$--6 polyunsaturated fatty acids (PUFAs) in patients experiencing a first psychotic episode [*ref le, frajerman*]. From a biophysical standpoint, such shifts modify acyl chain order, bilayer thickness, and bending stiffness ---  parameters that directly influence ligand partitioning and mobility.

In this context, the efficacy of amphiphilic drugs cannot be reduced to their affinity for a protein target alone. Their pharmacodynamic profile emerges from a coupled interaction with the lipid environment, which defines the free-energy landscape governing insertion, orientation, and diffusion. Upon entering the bilayer, a ligand may locally perturb membrane organization, while mesoscopic mechanical constraints reciprocally restrict the energetic configurations accessible to the drug. Ligand--membrane interactions should therefore be regarded as a coupled physicochemical system rather than a secondary step preceding receptor binding. As a dynamic filter shaping when, where, and how ligands engage their targets, local bilayer properties may constitute previously underappreciated determinants of drug response and efficacy.

== Lipid membranes as physicochemical systems

Lipid membranes are not homogeneous solvents but instead complex physicochemical systems, exhibiting rich phase behavior. This complexity is mainly brought by the diversity of their molecular constituents: headgroups, acyl chain saturation, and sterol content.

The nomenclature of phospholipids reflects this structural organization. Species are typically designated by a four-letter code in which the first two letters indicate the acyl chains, while the last two specify the headgroup. For instance, POPC is for _1-palmitoyl-2-oleoyl-sn-glycero-3-phosphocholine_, while SDPS denotes _1-stearoyl-2-docosahexaenoyl-sn-glycero-3-phospho-L-serine_.

Headgroups vary in size, charge distribution and hydrogen-bonding capability, thereby defining the interfacial character of the membrane [*ref revue lipides kim & yoo*]. These variations impose distinct geometric constraints at the molecular level, which propagate to the collective organization of the bilayer. _Phosphatidylcholines_ (PC headgroup) exhibit an approximately cylindrical geometry favoring lamellar structures , whereas smaller headgroups such as _phosphatidylethanolamine_ (PE) introduce packing asymmetry and curvature stress.

Beneath this interfacial layer, acyl chains determine the structure and dynamics of the hydrophobic core [*ref revue ali*]. Chain length and degree of unsaturation constitute the two primary variables. Increasing unsaturation enhances conformational flexibility: cis double bonds introduce kinks that disrupt tight packing, reduce chain order, and thus increasing membrane fluidity.

Beyond phospholipids, cell membranes also contain other essential lipids like sterols and sphingomyelins. The most famous member of the sterol family is cholesterol, which plays a vital role in regulating membrane fluidity and structural stability.

Variations in lipid composition give rise to distinct lamellar phase states [*ref*], notably,

- the gel phase ($L_beta$), in which lipid tails are highly ordered and tightly packed, leading to reduced lateral mobility and increased membrane rigidity,
- the liquid-ordered phase ($L_o$), typically promoted by cholesterol, combining high tail order with significant lateral mobility,
- the liquid-disordered phase ($L_d$), characterized by lower chain order, increased flexibility, and enhanced lateral diffusion. 

Although phase equilibria are temperature-dependent, physiological conditions typically constrain this parameter within a narrow range.

In multicomponent systems, compositional heterogeneity may emerge at larger length scales. Lipid--lipid interactions between different species can drive partial lateral demixing [*ref heberle*], leading to the formation of distinct domains within the same bilayer. Often discussed in the context of lipid rafts, this mesoscale structure reflects the balance between entropic mixing and favorable intermolecular interactions, and results in regions exhibiting various mechanical properties.

== Ligand–membrane coupling

While lipophilicity is often invoked to rationalize membrane affinity, a single partition coefficient (logP) cannot fully describe the complexity of ligand insertion into lipid bilayers, even though it is true that most CB1 ligands exhibit relatively high logP values [*ref* si rien littérature, faire un tableau nous meme]. One reason is that the experimental determination of logP typically relies on octanol--water partitioning [*ref method*], a simplified system that lacks the headgroup region --- which defines a chemically distinct interfacial environment.

Another limitation is that logP constitutes a purely thermodynamic descriptor and therefore provides little insight into the microscopic mechanism of insertion. It does not inform on whether a ligand preferentially enters through hydrophobic regions, whether it should reorient upon insertion, or how it organizes once embedded within the bilayer.

To characterize insertion preferences, it is more informative to compute potentials of mean force (PMFs) [*ref?*], that is, free--energy profiles evaluated along a chosen reaction coordinate --- typically the membrane normal --- using numerical approaches. PMFs provide access to the energetic cost associated with membrane entry, identify possible interfacial minima, and reveal insertion barriers that could not be inferred from a global partition coefficient alone. 

From this perspective, the membrane can be treated as an energy landscape experienced by the ligand. While such an approach is necessary to quantify insertion and identify potential barriers, it remains a reduced description of the interaction.  The question arises: what is the physical nature of ligand-membrane? A first level of consideration is steric. Much like inclusions in liquid crystals, an inserted ligand can be expected to behave as a local defect, perturbing lipid packing and altering the orientational order of neighboring acyl chains. Additional mechanical effects may also emerge; the ligand may locally displace lipids upon insertion, generating curvature stress or elastic deformation of the surrounding [*ref*].

Beyond steric and mechanical aspects, chemical and electrostatic contributions must be considered. The membrane interface is characterized by a heterogeneous distribution of charges and dipoles, and screening effects are not necessarily uniform across the interfacial region. From a physical standpoint, the bilayer thus constitutes an electromagnetic environment, within which local interactions may further modulate ligand behavior.

Within this framework, CP55,940 emerges as a particularly relevant model ligand for CB1. Beyond its established pharmacological profile [*ref*] as a potent CB1 agonist, it presents physicochemical characteristics that make it especially suitable for investigating ligand–-membrane coupling. It exhibits a relatively high partition coefficient, consistent with strong membrane affinity. Its molecular architecture combines an aromatic core and a hydrophobic aliphatic moiety, favoring insertion toward the bilayer interior, with additional polar functional groups capable of interacting with interfacial regions. Such amphiphilic balance makes it structurally compatible with prolonged residence within a bilayer while maintaining the ability to sample different insertion depths and orientations. It is therefore reasonable to treat CP55,940 as the molecular probe it has effectively become within the CB1 literature.


== Objectives
- Etudier l'influence des lipides sur le couplage ligand-membrane
- Explorer des effets d'échelles de la composition
- Donner une interprétation multiéchelle du contexte lipidomique
- Justifier l'approche 1 seul ligand
- Expliquer les différents indicateurs dont on va se servir (Sch, epaisseur, pourquoi on fait ça etc).



= Methods (3-4 pages)

Justifier les choix, mais ne pas refaire la démo de cmt tout fonctionne.

== All-atom molecular dynamics 

=== System composition
- Membrane types (gel, fluide, enrichies en SAPC/SDPC, etc.)
- Insertion du ligand

=== Force field and simulation parameters
- Justifier charmm36m
- Le choix de l'eau
- Le choix des barostats, thermostats
- Les pas de temps, la stratégie d'équilibration
- Durée des simulations, check de convergences

=== Energy considerations
- PMF, Energy profiles


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
- Comment être reproductible?

=  Atomistic results : lipid dependent ligand-membrane coupling (5-6 pages)

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
- Absence fo receptor
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
