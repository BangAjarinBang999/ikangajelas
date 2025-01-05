
class FishData {
  final String name;
  final String description;
  final String habitat;
  final String physicalChar;
  final String funFact;
  final String imagePath;

  FishData({
    required this.name,
    required this.description,
    required this.habitat,
    required this.physicalChar,
    required this.funFact,
    required this.imagePath,
  });
}

final Map<String, FishData> fishDatabase = {
  'ClownFish': FishData(
    name: 'Clown Fish',
    description: 'Ikan badut adalah ikan kecil berwarna cerah yang hidup di perairan laut tropis, terutama di terumbu karang',
    habitat: 'Clownfish hidup di terumbu karang tropis di Samudra Hindia, Pasifik, dan Laut Merah. Mereka tinggal di antara tentakel anemon laut yang memberikan perlindungan dari predator, sementara clownfish membantu membersihkan anemon dari sisa makanan.',
    physicalChar: 'Clownfish memiliki tubuh kecil berwarna cerah, biasanya oranye dengan tiga garis putih vertikal yang dikelilingi tepi hitam. Panjang tubuhnya berkisar antara 4-15 cm, dan lapisan lendir di kulitnya melindungi dari sengatan anemon laut.',
    funFact: 'Clownfish dapat mengubah jenis kelamin; jantan terbesar dalam kelompok berubah menjadi betina jika betina dominan mati. Mereka juga terkenal karena hubungan simbiosis mutualisme dengan anemon dan popularitasnya meningkat setelah film Finding Nemo.',
    imagePath: 'assets/images/clownfish.png',
  ),
  
  'Shark': FishData(
    name: 'Shark',
    description: 'Hiu adalah predator laut yang kuat dan efisien, memainkan peran penting dalam menjaga keseimbangan ekosistem laut',
    habitat: 'Hiu dapat ditemukan di semua lautan dunia, dari perairan dangkal hingga laut dalam. Beberapa spesies hidup di dekat pantai, sementara yang lain lebih memilih perairan terbuka.',
    physicalChar: 'Hiu memiliki tubuh yang streamline dengan kulit yang kasar, sirip yang kuat, dan rangka dari tulang rawan. Ukurannya bervariasi dari 20 cm hingga 12 meter, tergantung spesiesnya.',
    funFact: 'Hiu memiliki kemampuan untuk mendeteksi listrik yang sangat lemah dari mangsanya menggunakan organ khusus yang disebut ampullae of Lorenzini. Mereka juga terus-menerus mengganti giginya sepanjang hidup mereka.',
    imagePath: 'assets/images/shark.png',
  ),

  'Marlin': FishData(
    name: 'Marlin',
    description: 'Marlin adalah ikan laut besar yang terkenal dengan kecepatan dan kekuatannya, sering menjadi target dalam memancing olahraga',
    habitat: 'Marlin hidup di perairan hangat dan sedang di seluruh dunia. Mereka sering ditemukan di laut terbuka, bermigrasi mengikuti arus hangat.',
    physicalChar: 'Marlin memiliki tubuh yang memanjang dengan "tombak" panjang karakteristik. Mereka bisa tumbuh hingga 5 meter dan beratnya bisa mencapai 800 kg. Warnanya bervariasi dari biru tua hingga hitam di bagian atas.',
    funFact: 'Marlin adalah salah satu ikan tercepat di lautan, bisa berenang dengan kecepatan hingga 110 km/jam. Mereka menggunakan "tombak" mereka untuk memukul dan melumpuhkan mangsa mereka.',
    imagePath: 'assets/images/marlin.png',
  ),

  'Remora': FishData(
    name: 'Remora',
    description: 'Remora adalah ikan unik yang terkenal dengan kemampuannya menempel pada hewan laut besar',
    habitat: 'Remora dapat ditemukan di perairan hangat di seluruh dunia, biasanya menempel pada hiu, paus, penyu laut, dan kadang-kadang kapal.',
    physicalChar: 'Ciri khas remora adalah organ penghisap di bagian atas kepala yang merupakan modifikasi dari sirip punggung. Ukurannya bervariasi dari 30-90 cm.',
    funFact: 'Remora memiliki hubungan yang unik dengan inangnya - mereka mendapatkan makanan dan transportasi gratis sambil membantu membersihkan parasit dari inang mereka.',
    imagePath: 'assets/images/remora.png',
  ),

  'Puffer Fish': FishData(
    name: 'Puffer Fish',
    description: 'Ikan buntal adalah ikan yang terkenal dengan kemampuannya mengembungkan diri ketika merasa terancam',
    habitat: 'Ikan buntal dapat ditemukan di perairan tropis dan subtropis di seluruh dunia, baik di laut maupun air tawar.',
    physicalChar: 'Memiliki kulit yang kasar dan kemampuan unik untuk mengembangkan tubuhnya hingga beberapa kali lipat ukuran normalnya. Ukurannya bervariasi dari 3 cm hingga 70 cm.',
    funFact: 'Ikan buntal mengandung tetrodotoxin, racun yang sangat kuat yang dapat mematikan. Di Jepang, koki khusus harus memiliki lisensi untuk menyiapkan fugu (ikan buntal) sebagai makanan.',
    imagePath: 'assets/images/pufferfish.png',
  ),

  'Lion Fish': FishData(
    name: 'Lion Fish',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Sturgeon': FishData(
    name: 'Sturgeon',
    description: 'Sturgeon adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Arwana': FishData(
    name: 'Arwana',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Archer Fish': FishData(
    name: 'Archer Fish',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Cupang': FishData(
    name: 'Cupang',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Koi': FishData(
    name: 'Koi',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),

  'Lohan': FishData(
    name: 'Lohan',
    description: 'Ikan singa adalah spesies ikan yang indah namun berbahaya dengan duri beracun',
    habitat: 'Aslinya berasal dari Indo-Pasifik, sekarang dapat ditemukan di berbagai perairan tropis di seluruh dunia, termasuk Atlantik dan Karibia.',
    physicalChar: 'Memiliki sirip yang panjang dan berduri dengan pola bergaris yang mencolok. Warnanya bervariasi dari merah, cokelat, hingga putih. Ukurannya bisa mencapai 45 cm.',
    funFact: 'Ikan singa adalah spesies invasif yang sangat sukses dan merupakan ancaman bagi ekosistem terumbu karang di beberapa wilayah. Duri beracunnya dapat menyebabkan rasa sakit yang ekstrem pada manusia.',
    imagePath: 'assets/images/lionfish.png',
  ),
};
