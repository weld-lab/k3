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

The endocannabinoid system (ECS) plays a central role in neuronal signaling and is a prime pharmacological target for various neurological and metabolic disorders. At its core lies the cannabinoid receptor type 1 (CB1), a G protein-coupled receptor (GPCR) that is among the most abundantly expressed receptors in the mammalian central nervous system [*ref*].

Unlike classical neurotransmitters, which are stored in synaptic vesicles and released into the aqueous synaptic cleft, endogenous ligands are lipid-derived molecules synthesized on demand from the hydrolysis of membrane phospholipids [*ref*]. Due to their pronounced lipophilicity, they partition into the lipid bilayer, making the membrane the primary medium for ligand transport. Recent structural biology and pharmacological assays suggest that the orthosteric binding pocket of CB1 is not accessed from the extracellular bulk, but rather via lateral diffusion from the intramembrane space [*ref*]. Consequently, the plasma membrane acts as more than a passive scaffold; it functions as a physicochemical pre-filter that dictates local bioavailability and orientation of ligands before receptor engagement.


The presynaptic membrane, where CB1 is largely localized, exhibits a rich lipid architecture --- in sterols, phospholipids and sphingolipids [*ref*] --- that maintains the mechanical and chemical environment necessary for synaptic transmission [*ref*]. However, this environment is susceptible to physiological and pathological remodeling. For instance, clinical lipidomic analyses have identified significant depletion in polyunsaturated fatty acids ($omega$--6) content in patients experiencing a first psychotic episode [*ref*]. From a biophysical perspective, such compositional shifts modify the fundamental properties of the bilayer, including acyl chain order, thickness, bending stiffness, ...

In this context, the efficacy of amphilic drugs is tied to their coupling with their lipid environment: the pharmacodynamic profile of a drug is not only a function of its affinity for the protein target, but also of its ability to navigate the free energy landscape imposed by its environment. Once ligand inserts the bilayer, it may locally perturb the nanoscopic organization of the membrane, while the mesoscopic mechanical constraints reciprocally limit the energetic configurations accessible to the drug.

Therefore, the ligand-membrane interaction should be regarded as a coupled physicochemical system, in which local lipid composition acts a critical determinant of drug partioning, diffusion, and ultimately, pharmacological potency. As such, drug-membrane coupling cannot be reduced to a secondary effect preceding receptor binding, but rather constitutes a layer of regulation in its own right. Characterizing this interaction is consequently essential for a comprehensive understanding of membrane-associated drug behavior.

== Lipid membranes as physicochemical systems
- Riche comportement de phases (gel, liquid ordered, liquid disordered, lamellaire, micelles, ...)
- Role des (un)saturations
- L'effet du cholésterol dans la littérature
- La diversité des têtes
- Quelques données mécaniques si nécessaire (pression latérale etc)

== Ligand-membrane coupling
- Insertion, coefficient de partition (logP)
- Energie, couplage mecanique
- Bref revue des ligands du CB1
- Justifier que CP55 est un bon modèle (caractéristiques physicochimiques)

== Objectives
- Etudier l'influence des lipides sur le couplage ligand-membrane
- Explorer des effets d'échelles de la composition
- Donner une interprétation multiéchelle du contexte lipidomique



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
- lipid ?
- scaffold
