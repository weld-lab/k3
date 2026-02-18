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

== Biological and pharmacological Context
- Rapidement l'existence du CB1 et le système endocannabinoide
- Où est exprimé le CB1
- Contexte lipidomique de ces zones
- Altération lipidique, par exemple chez les patients préschizophrènes (w6 depletion)
- Pourquoi les membranes peuvent interagir avec le médicament (allostérie, deuxième cible quand y'a un "miss" du récepteur, etc)

== Lipid membranes as physical systems
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

