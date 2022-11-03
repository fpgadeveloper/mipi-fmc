# 4-lane MIPI FMC example design

This is (the very early stage of) an example design for a new FMC product that we are developing.
The card will have two independent 4-lane MIPI interfaces for connection to MIPI image sensors.
The main purpose of the design at the moment is to validate our product and it's compatibility
with the carriers that we intend to support.

At the moment, we intend to support the following boards:

* ZCU104 (LPC: 2x cameras)
* ZCU102 (HPC0: 2x cameras, HPC1: 1x camera)
* ZCU106 (HPC0: 2x cameras, HPC1: 1x camera)
* PYNQ-ZU (LPC: 2x cameras)
* Genesys-ZU (LPC: 2x cameras)
* UltraZed EV carrier (HPC: 2x cameras)
* VCU118 (HPC: 2x cameras, FMCP: 2x cameras)

That list may grow, but may also shrink depending on any issues that we come across during
development.
