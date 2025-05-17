<template>
  <header class="bg-white shadow sticky top-0 z-50">
    <nav class="container mx-auto flex items-center justify-between py-4 px-6">
      <!-- Logo -->
      <a href="/" class="flex items-center space-x-2">
        <svg class="h-10 w-10 text-blue-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
          <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
            d="M12 2L2 7l10 5 10-5-10-5zm0 0v18m0 0l-7-4m7 4l7-4" />
        </svg>
        <span class="text-2xl font-bold text-gray-800 tracking-tight">CCIS</span>
      </a>
      <!-- Navigation Desktop -->
      <ul class="hidden md:flex space-x-8 items-center">
        <li><a href="/" class="text-gray-700 hover:text-blue-600 font-medium transition">Accueil</a></li>
        <li><a href="/about" class="text-gray-700 hover:text-blue-600 font-medium transition">À propos</a></li>
        <!-- Dropdown -->
        <li class="relative" @mouseleave="dropdownOpen = false">
          <button
            @mouseenter="dropdownOpen = true"
            @click="dropdownOpen = !dropdownOpen"
            class="flex items-center text-gray-700 hover:text-blue-600 font-medium transition focus:outline-none"
            :aria-expanded="dropdownOpen"
            aria-haspopup="true"
            type="button"
          >
            Services
            <svg class="ml-1 h-4 w-4 transition-transform duration-200"
                 :class="dropdownOpen ? 'rotate-180' : ''"
                 fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
            </svg>
          </button>
          <transition name="dropdown">
            <div
              v-if="dropdownOpen"
              class="absolute left-0 mt-2 w-64 bg-white border rounded shadow-lg z-50 animate-fade-in"
              @mouseenter="dropdownOpen = true"
              @mouseleave="dropdownOpen = false"
            >
              <ul class="py-2">
                <li v-for="item in services" :key="item" >
                  <a href="#" class="block px-4 py-2 hover:bg-blue-50 transition">{{ item }}</a>
                </li>
              </ul>
            </div>
          </transition>
        </li>
        <li><a href="/contact" class="text-gray-700 hover:text-blue-600 font-medium transition">Contact</a></li>
      </ul>
      <!-- User/Connexion -->
      <div class="flex items-center space-x-4">
        <button class="hidden md:inline-flex items-center px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition font-semibold">
          Connexion
        </button>
        <!-- Mobile menu button -->
        <button @click="toggleMenu" class="md:hidden focus:outline-none">
          <svg class="h-7 w-7 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path v-if="!menuOpen" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M4 6h16M4 12h16M4 18h16" />
            <path v-else stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
              d="M6 18L18 6M6 6l12 12" />
          </svg>
        </button>
      </div>
    </nav>
    <!-- Mobile menu -->
    <transition name="fade">
      <div v-if="menuOpen" class="md:hidden bg-white shadow-lg animate-fade-in">
        <ul class="flex flex-col space-y-2 px-6 py-4">
          <li><a href="/" class="text-gray-700 hover:text-blue-600 font-medium transition">Accueil</a></li>
          <li><a href="/about" class="text-gray-700 hover:text-blue-600 font-medium transition">À propos</a></li>
          <li>
            <button @click="mobileDropdownOpen = !mobileDropdownOpen" class="w-full text-left text-gray-700 hover:text-blue-600 font-medium transition flex items-center">
              Services
              <svg class="ml-1 h-4 w-4 transition-transform duration-200"
                   :class="mobileDropdownOpen ? 'rotate-180' : ''"
                   fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <transition name="dropdown">
              <ul v-if="mobileDropdownOpen" class="pl-4 mt-1 space-y-1 animate-fade-in">
                <li v-for="item in services" :key="item">
                  <a href="#" class="block px-2 py-1 hover:bg-blue-50 rounded transition">{{ item }}</a>
                </li>
              </ul>
            </transition>
          </li>
          <li><a href="/contact" class="text-gray-700 hover:text-blue-600 font-medium transition">Contact</a></li>
          <li>
            <button class="w-full mt-2 px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition font-semibold">
              Connexion
            </button>
          </li>
        </ul>
      </div>
    </transition>
  </header>
</template>

<script>
export default {
  name: 'Header',
  data() {
    return {
      menuOpen: false,
      dropdownOpen: false,
      mobileDropdownOpen: false,
      services: [
        "Certificats d'origine",
        "Légalisation de documents",
        "Formation continue",
        "Accompagnement à l'export",
        "Médiation",
        "Services aux investisseurs"
      ]
    }
  },
  methods: {
    toggleMenu() {
      this.menuOpen = !this.menuOpen;
      if (!this.menuOpen) this.mobileDropdownOpen = false;
    },
    handleClickOutside(event) {
      // Desktop dropdown
      if (this.dropdownOpen && !this.$el.contains(event.target)) {
        this.dropdownOpen = false;
      }
      // Mobile dropdown
      if (this.mobileDropdownOpen && !this.$el.contains(event.target)) {
        this.mobileDropdownOpen = false;
      }
    }
  },
  mounted() {
    // Ferme le dropdown si on clique en dehors
    document.addEventListener('click', this.handleClickOutside);
  },
  beforeUnmount() {
    document.removeEventListener('click', this.handleClickOutside);
  }
}
</script>

<style scoped>
.fade-enter-active, .fade-leave-active,
.dropdown-enter-active, .dropdown-leave-active {
  transition: opacity 0.2s, transform 0.2s;
}
.fade-enter-from, .fade-leave-to,
.dropdown-enter-from, .dropdown-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}
.fade-enter-to, .fade-leave-from,
.dropdown-enter-to, .dropdown-leave-from {
  opacity: 1;
  transform: translateY(0);
}
.animate-fade-in {
  animation: fadeIn 0.2s;
}
@keyframes fadeIn {
  from { opacity: 0; transform: translateY(-10px);}
  to { opacity: 1; transform: translateY(0);}
}
</style> 