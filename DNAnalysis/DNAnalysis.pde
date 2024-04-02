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
getProtein(String strand)

Find the indices of the start and end codons in strand.
If strand does not contain a start or end, return ""
If the number of neucleotides between start and end
is not a multiple of 3, return ""
If there are not at least 5 consdons between start and
end, return ""
Otherwise, return the neucleotide sequence encoding a
protein, not including the start and end codons.
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



int findProteinEnd(String strand) {
  int end0 = strand.indexOf("taa");
  int end1 = strand.indexOf("tga");
  int end2 = strand.indexOf("tag");

  //if no end, return -1
  if (end0 + end1 + end2 == -3) {
    return -1;
  }//no end codon

  //? : is the ternary operator. It's like
  // an if/else statement that returns a value.
  // boolean ? true return : false return
  end0 = end0 == -1 ? strand.length() : end0;
  end1 = end1 == -1 ? strand.length() : end1;
  end2 = end2 == -1 ? strand.length() : end2;

  return min(end0, end1, end2);
}//findProteinEnd

boolean containsProtein(String strand) {
  int start = strand.indexOf("atg");
  int end = findProteinEnd(strand);

  if (start == -1 || end == -1) {
    return false;
  }//missing start or end

  int sequenceLength = end - start;
  //if not a multiple of 3, there are "loose" nucleotides
  if (sequenceLength % 3 != 0) {
    return false;
  }//invalid length

  //need to have at least 5 codons, or
  //15 nucleaotides, between start and end
  return sequenceLength >= 18;
}//containsExon

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
