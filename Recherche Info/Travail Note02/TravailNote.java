package ca.qc.teluq.recherche;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Travail Note 02 
 * Cours  : Recherche d'Informations et Web
 * Eleve  : Julio Cesar Torres dos Santos 
 * Charge : Samy Chamby
 * Date   : 21 fevrier 2016
 * 
 * @author juliozohar
 *
 */

public class TravailNote {

	// ==== QUESTION 01 ===== // 
	
	/**
	 * Texte de recherche de la premiere question
	 */
	private static final String texte = "abababababababababababababbaaaaabbbbababababababab";
	
	/**
	 * Variable de travail pour varier la longueur du texte a matcher avec la Regex. 
	 */
	static String subtexte = "";

	/**
	 * Differentes longueurs de texte a traiter avec la Regex. 
	 */
	static int [] texteLength = {1, 10, 20, 30, 40, 50}; 
	
	/**
	 * Trouver le pattern dans le text, en utilisant l'expression avide suggere dans l'exercice. 
	 */
	private static final Pattern PATTERN_EXPR_01 = Pattern.compile("(a*b*)*c",Pattern.CASE_INSENSITIVE);
	
	/**
	 * Trouver le pattern dans le text, en utilisant l'expression optimisee avec le quantificateur 
	 * paresseux. 
	 */
	private static final Pattern PATTERN_EXPR_01_LAZY = Pattern.compile("(a*b*)?c",Pattern.CASE_INSENSITIVE);

	
	
	// ===== QUESTION 02 ===== // 
	
	/**
	 * Trouver les mots entre (dog et cat) ou (cat et dog)
	 * <code>(?<=dog)</code> cet operateur fait le lazy match
	 * <code>|</code> caractere OU
	 * <code>.</code> caractere quelque chose
	 * <code>*</code> zero ou plusieurs fois
	 */
	private static final Pattern PATTERN_ENTRE_CAT_DOG = Pattern.compile("(?<=(\\b(dog|cat)(s|))\\s)(.*)(?=(\\b(dog|cat)(s|)))", Pattern.CASE_INSENSITIVE);
	/**
	 * Trouver les mots avec plus de 3 chars.
	 * <code>\w</code> alfanumerique
	 * <code>{3,}</code> minumum 3 caracteres.
	 */
	private static final Pattern PATTERN_PLUS_3_LETTRES = Pattern.compile("\\w{3,}");
	
	
	/**
	 * Soit le texte « abababababababababababababbaaaaabbbbababababababab » ; 
	 * en prenant les n premiers caractères de ce texte, calculez le temps nécessaire 
	 * pour Java de vérifier une concordance avec l’expression régulière « (a*b*)*c ». 
	 * Complétez le tableau :
		n	Temps de traitement (approximatif)
		1	
		10	
		20	
		30	
		40	
		50	
	 *	
	 * Trouvez une expression régulière équivalente à « (a*b*)*c » qui permette un calcul beaucoup plus rapide.
	 * Croyez-vous qu’il est possible d’améliorer le moteur d’expressions régulières de Java pour qu’il puisse 
	 * toujours réécrire les expressions régulières trop lentes en des expressions régulières plus rapides ? 
	 * Commentez.
	 * 
     * Pour réaliser ce travail, vous pouvez modifier le programme Motif.java pour calculer le temps écoulé. 
     * Pour un exemple de ce type de calcul, consultez le fichier Regex.java.
	 * 
	 */
	public void question01(){
		
		//Traitement de l'expression originale suggeree dans la question  
		System.out.println("n \t Temps de traitement (aproximatif / segs)");
		for(int i=0; i < texteLength.length; i++){
			long debut = System.currentTimeMillis(); 
			System.out.println(texte.substring(0, texteLength[i]));
			Matcher m = PATTERN_EXPR_01.matcher(texte.substring(0, texteLength[i])); 
			m.matches();
			
			long fin = System.currentTimeMillis();
			double duration = ((fin-debut)/1000.0); 
			System.out.println(texteLength[i] + "\t " + duration);
		}
		
		//Traitement de l'expression modifiee pour etre optimisee avec quantificateur paresseux
		System.out.println("n \t Temps de traitement (aproximatif / segs)");
		for(int i=0; i < texteLength.length; i++){
			long debut = System.currentTimeMillis(); 
			System.out.println(texte.substring(0, texteLength[i]));
			Matcher m = PATTERN_EXPR_01_LAZY.matcher(texte.substring(0, texteLength[i])); 
			m.matches();
			
			long fin = System.currentTimeMillis();
			double duration = ((fin-debut)/1000.0); 
			System.out.println(texteLength[i] + "\t " + duration);
		}
	}
	
	
	/**
	 * À l’aide du programme Java « Regex », trouvez tous les fichiers contenant une ligne ayant 
	 * à la fois le mot « dog » et le mot « cat », dans tous les fichiers du répertoire etext00 du 
	 * cédérom Gutenberg. Donnez la formulation ou la « construction » de votre expression régulière. 
	 * Le mot dog peut apparaître avant ou après le mot cat. Par ailleurs, les mots peuvent être 
	 * capitalisés (Dog ou dog) et ils peuvent être aux pluriel (dog ou dogs).

     * En reprenant l’expression régulière précédente, écrivez un programme basé sur les expressions 
     * régulières qui sélectionne tous les mots de plus de 3 caractères situés entre les mots « dog » 
     * et « cat ». En utilisant un programme similaire au programme Java « Regex » [1], testez votre 
     * programme sur les exemples suivants :

	 * - Dogs are nice animals. Cats are not. 
	 * - My cat ate a mice. My dog once ate a fry. 
	 * - My dog once ate a fry. My cat ate a mice. 
	 * - The catalog of the best dogs is around here somewhere.

	 * Votre programme devrait donner la liste des mots ayant plus de 3 caractères situés entre les mots 
	 * dog et cat pour chacune des phrases. Donnez le résultat obtenu pour chaque expression.

   	 * Votre programme Java ne doit utiliser qu’une seule expression Java. Celle-ci, et seulement celle-ci,  
	 * doit sélectionner les mots requis. Il n’est pas permis de traiter les chaînes de caractères en Java 
	 * autrement que par l’expression régulière pour réussir ce problème.
	 */
	public void question02(){

		
		String [] textes = {
 				 "Dogs are nice animals. Cats are not.",  
				 "My cat ate a mice. My dog once ate a fry.",  
				 "My dog once ate a fry. My cat ate a mice.",  
				 "The catalog of the best dogs is around here somewhere." 
		};

		for(int i=0; i < textes.length; i++){
			System.out.println("Text : " + textes[i]);
			Matcher matcherDogCat = PATTERN_ENTRE_CAT_DOG.matcher(textes[i]);;
			if(matcherDogCat.find()){
				String contenuEntre = textes[i].substring(matcherDogCat.start(), matcherDogCat.end());  
				Matcher matcher3lettres = PATTERN_PLUS_3_LETTRES.matcher(contenuEntre); 
				while(matcher3lettres.find()){
					System.out.println(contenuEntre.substring(matcher3lettres.start(), matcher3lettres.end())); 
				}
				matcherDogCat.reset();
			}
			
		}		
	}
	
	public static void main(String args[]){
		TravailNote tn = new TravailNote();	
		tn.question01();
		tn.question02();
	}
}
