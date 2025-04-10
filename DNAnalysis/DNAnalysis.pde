String s0 = "tcgcagctcgaaccactatc";
String s1 = "agcgtcgagcttggttatac";
String s2 = "atcgtccagctatatcatac";
String s3 = "caatcacctcagtatcgcga";

String protein0 = "atgtcgcagctcgaaccactgtga";
String protein1 = "tcgatgcagctcgaaccactgtag";
String protein2 =   "agatgcgtcgagcttggttatcttgctaac";
String noProtein0 = "tcgatgcagctcgaaccactg";
String noProtein1 = "tcgcagctcgaaccactgtag";
String noProtein2 = "tcgtagcagctcgaaccactgatg";
String noProtein3 = "atgtcgcagtaactcgaaccactg";
String noProtein4 = "tcgatgcagctcgaacactgtag";

String bigStrand =  s0 + s1 + protein0 + s2 + protein1 + s3 + protein2;

int NUC_SIZE = 30;
String START_CODON = "atg";
int STAT_SIZE = 20;

void setup() {
  size(810, 500);
  background(0);
  drawProtein(bigStrand, 0, 100, NUC_SIZE);
  displayStats(bigStrand);
}//setup

/*=====================================
intFindProteinEnd(String strand)

End codons are taa, tga, and tag
Returns the index of the first end codon in strand.
Returns -1 if there is no end codon in strand.
=====================================*/
int findProteinEnd(String strand) {
  return -1;
}//findProteinEnd

/*=====================================
boolean containsProtein(String dna)

Returns true if dna contains at least one protein.
For our purposes, a DNA sequence contains a protein if:
    It has a start codon
    It has an end codon
    The number of nucleotides between the start and end is a multiple of 3 (i.e. there are no nucleotides unattached to a codon)
    It has at least 5 other codons between those 2. (this is not biologically accurate, in reality this is closer to 430 codons).
=====================================*/
boolean containsProtein(String strand) {
  return false;
}//containsProtein

/*=====================================
getProtein(String strand)

If strand contains a protien as defined in
the description of containsProtein, return
the first protien present.

If strand does not contain a protein, return
the empty string.
=====================================*/
String getProtein(String strand) {
  return "";
}//getProtein

/*=====================================
getProteins(String dna)

Return an ArrayList containing all the protien
sequences in dna.
=====================================*/
ArrayList<String> getProteins(String dna) {
  ArrayList<String> proteins = new ArrayList<String>();
  return proteins;
}//getProteins

/*=====================================
displayStats(String dna)

Display various stats about dna to the screen.
Set the following variables correctly:
  int neucleotideCount: Total number of neucleotides
  int codonCount: Total number of codons
  ArrayList<String> proteins: All the proteins
  int proteinCount: Total count of proteins.
  int exonCount: Total number of neucleotides that encode
  proteins, including start and end codons.
  int intronCount: Total number of neucleotides that do
  not encode proteins.
=====================================*/
void displayStats(String dna) {
  textAlign(LEFT, TOP);
  fill(255);
  textSize(STAT_SIZE);
  int neucleotideCount = 0;
  int codonCount = 0;
  ArrayList<String> proteins = null;
  int proteinCount = 0;
  int exonCount = 0;
  int intronCount = 0;
  text("Total neucleotides: " + neucleotideCount, 0, 0);
  text("Total codons: " + codonCount, 200, 0);
  text("Total exons: " + exonCount, 400, 0);
  text("Total introns: " + intronCount, 600, 0);
  text("Proteins\n" + proteins, 0, STAT_SIZE);
}//displayStats

/*=====================================
highLightSequence(int x, int y, int startPos,
                  int sequenceLength, int sz, color c)

Draw sequenceLength amount of squares with size sz and color c
underneath a corresponding dna strand. The squares should
highlight the neucleotide sequence starting at startPos
that is sequenceLength long.
(x, y) represents the absolute start position of the larger
dna strand.
=====================================*/
void highLightSequence(int x, int y, int startPos, int sequenceLength, int sz, color c) {

}//highLightCodon

/*=====================================
drawProtein(String dna, int x, int y, int sz)

call drawStrand
Then go through dna and call highLightSequence
for every protein.
  draw green squares under the start codons
  draw red squares under the end codons
  draw yellow squares under the protein
  codons between the start and end.
=====================================*/
void drawProtein(String dna, int x, int y, int sz) {
  drawStrand(dna, x, y, sz);

}//drawProtein



void drawStrand(String dna, int x, int y, int sz) {
  textAlign(CENTER, CENTER);
  dna = dna.toUpperCase();
  for (int i=0; i<dna.length(); i++) {
    drawBase(dna.charAt(i), x, y, sz);
    x+= sz;
    if (x+sz > width) {
      x = 0;
      y+= sz*2;
    }
  }//loop through chars
}//drawStrand

void drawBase(char base, int x, int y, int sz) {
  noStroke();
  fill(charToColor(base));
  square(x, y, sz);

  fill(255);
  textSize(sz);
  text(base, x+sz/2, y+sz/2);
}//drawBase


color charToColor(char c) {
  color col = color(0);
  if (c == 'A') {
    col = #fa3737;//#F5793A;
  }
  else if (c == 'T') {
    col = #7c0000;//#A95AA1;
  }
  else if (c == 'C') {
    col = #85C0F9;
  }
  else if (c == 'G') {
    col = #0F2080;
  }
  return col;
}//charTocolor
