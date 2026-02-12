# What We Know

## Previous Research

1. There has been multiple studies which confirmed that traditional barcodes like _matK_, _rbcL_, and _trnH-psbA_ don't have enough sequence variation to distinguish closely related species of _Capsicum_ <!-- Hu et al. (2021), Chandrasekara et al. (2021), Abdelaziz et al. (2024) -->.
2. Researchers have published complete chloroplast genomes for specific varieties. <!-- Capsicum lycianthoides, Capsicum pubscens, Capsicum annuum, Capsicum chinense, Capsicum chacoense, Capsicum galapagoense (Sebastin et al., 2024; He et al., 2024; Arbizu et al., 2022; Papastolopoulou et al., 2025)  -->
3. Studies have identified that the **most** variations in the _Capsicum_ plastome occur in the Large Single-Copy (LSC) region and Small Single-Copy (SSC) regions, specifically in the intergenic spacer regions <!-- Jiang et al., 2023; Jia et al., 2024 -->.

## Research Gap

While the data exists, it's **still highly fragmented**.

1. Most genomic studies focus on South American wild species, or East Asian commercial cultivars.
2. Indonesian landraces are **underrepresented** in genomic databases.
3. Because standard barcodes fail _Capsicum_, we need to identify **novel** hyper-variable regions across the entire genus.

## Proposed Angle

**Title**: _In Silico_ Identification of Novel Chloroplast Hyper-Variable Regions for High-Resolution Barcoding of _Capsicum_ Landraces.

### Workflow

1. **DATA MINING** - Web Client
    - Search the NCBI Nucleotide database for complete _Capsicum_ chloroplast genomes.
    - Download 15-20 high-quality sequences representing diverse species.
    - Download as both FASTA and GenBank formats.
2. **MULTIPLE SEQUENCE ALIGNMENT** - R
    - Using `msa` package to align the complete chloroplast genomes.
    - Create a single "master alignment file" (`.fas` or `.aln`) to serve as basis for analysis.
3. **SLIDING WINDOW ANALYSIS** - R
    - Using `ape` or `PopGenome` package to perform sliding window analysis.
    - Window length: ~600 bp. <!-- Find studies that have done this -->
    - Step size: ~200 bp. <!-- Find studies that have done this -->
    <!-- For sliding window: Cirulli et al. (2024); Jiang and Shi (2025) -->
    - Identify hyper-variable regions based on sequence divergence.
    - Calculate Nucleotide Diversity (Pi) and the number of polymorphic sites.
4. **SEQUENCE EXTRACTION & PRIMER DESIGN** - R
    - Using `DECIPHER` package to extract the hyper-variable regions.
    - Also using `DECIPHER`, generate forward and reverse primers based on standard PCR constraints. <!-- Research what this is, has to be based on... something. -->
5. **IN SILICO VALIDATION** - R
    - Using `DECIPHER` package, specifically the `AmplifyDNA()` function, simulate the thermocycling conditions to validate the primers.
    - Calculate the exact length of each amplicon from the output to ensure they differ enough between _Capsicum_ species to be useful for barcoding.

<!-- 
Hu, J., Ci, X., Liu, Z., Dormontt, E., Conran, J., Lowe, A., & Li, J. (2021). Assessing candidate DNA barcodes for Chinese and internationally traded timber species. Molecular Ecology Resources, 22, 1478 - 1492. https://doi.org/10.1111/1755-0998.13546.

Chandrasekara, C., Nathasha, D., Naranpanawa, U., BSupunBandusekara, I., Pushpakumara, D., Siril, D., Wijesundera, A., PradeepaC., G., & Bandaranayake, I. (2021). Universal barcoding regions, rbcL, matK and trnH-psbA do not discriminate Cinnamomum species in Sri Lanka. PLoS ONE, 16. https://doi.org/10.1371/journal.pone.0245592.

Abdelaziz, S., Khaled, K., Younis, R., Al-Kordy, M., El-Domyati, F., & Moghazee, M. (2024). Comparison of four DNA barcoding loci to distinguish between some Apiaceae family species. Beni-Suef University Journal of Basic and Applied Sciences, 13. https://doi.org/10.1186/s43088-023-00457-7.
-->

<!--
Sebastin, R., Kim, J., Jo, I., Yu, J., Jang, W., Han, S., Park, H., AlGarawi, A., Hatamleh, A., So, Y., Shim, D., & Chung, J. (2024). Comparative chloroplast genome analyses of cultivated and wild Capsicum species shed light on evolution and phylogeny. BMC Plant Biology, 24. https://doi.org/10.1186/s12870-024-05513-7.

He, S., Siman, Y., Li, G., Lv, J., Zhao, K., & Deng, M. (2024). Chloroplast genome characteristic, comparative and phylogenetic analyses in Capsicum (Solanaceae). BMC Genomics, 25. https://doi.org/10.1186/s12864-024-10980-1.

Arbizu, C., Saldaña, C., Ferro-Mauricio, R., Chávez-Galarza, J., Herrera, J., Contreras-Liza, S., Contreras-Liza, S., Guerrero-Abad, J., & Maicelo, J. (2022). Characterization of the complete chloroplast genome of a Peruvian landrace of Capsicum chinense Jacq. (Solanaceae), arnaucho chili pepper. Mitochondrial DNA. Part B, Resources, 7, 156 - 158. https://doi.org/10.1080/23802359.2021.2014366.

Papastolopoulou, C., Nieuwenhuis, R., Warris, S., Bakker, L., Van Haarst, J., Cordewener, J., Hesselink, T., Van Den Broeck, H., Van Dooijeweert, W., De Jong, H., Chunwongse, J., Trivino, S., Schijlen, E., De Ridder, D., Smit, S., & Peters, S. (2025). Three novel genomes broaden the wild side of the Capsicum pangenome. bioRxiv. https://doi.org/10.1101/2025.06.03.657591.
-->

<!-- 

Jiang, D., Cai, X., Xia, M., Xing, H., Dong, S., Tian, S., Li, J., Lin, J., Liu, Y., & Li, H. (2023). Complete chloroplast genomes provide insights into evolution and phylogeny of Zingiber (Zingiberaceae). BMC Genomics, 24. https://doi.org/10.1186/s12864-023-09115-9.

Jia, M., Wang, J., Cao, D., Jiang, C., Li, W., Tembrock, L., Xing, G., Li, S., & Wu, Z. (2024). The pan-plastome of Hemerocallis citrina reveals new insights into the genetic diversity and cultivation history of an economically important food plant. BMC Plant Biology, 24. https://doi.org/10.1186/s12870-023-04668-z.
-->

<!-- 
Cirulli, E., Barrett, K., Bolze, A., Judge, D., Pawloski, P., Grzymski, J., Lee, W., & Washington, N. (2024). A power-based sliding window approach to evaluate the clinical impact of rare genetic variants in the nucleotide sequence or the spatial position of the folded protein. Human Genetics and Genomics Advances, 5. https://doi.org/10.1016/j.xhgg.2024.100284.

Jiang, N., & Shi, Y. (2025). A New Adaptive Sliding Window Method for fMRI Dynamic Functional Connectivity Analysis. International Journal of Imaging Systems and Technology, 35. https://doi.org/10.1002/ima.70154.
-->