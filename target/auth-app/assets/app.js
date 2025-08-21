// Lightweight client-side validation + micro-animations
function shake(el){ el.classList.remove('shake'); void el.offsetWidth; el.classList.add('shake'); }

function validateRegister(){
  const name = document.getElementById('regName');
  const email = document.getElementById('regEmail');
  const pass = document.getElementById('regPassword');
  const confirm = document.getElementById('regConfirm');

  if(!name.value.trim()){ shake(name); name.focus(); return false; }
  if(!email.value.includes('@')){ shake(email); email.focus(); return false; }
  if(pass.value.length < 6){ shake(pass); pass.focus(); return false; }
  if(pass.value !== confirm.value){ shake(confirm); confirm.focus(); return false; }
  return true;
}

function validateLogin(){
  const email = document.getElementById('loginEmail');
  const pass = document.getElementById('loginPassword');
  if(!email.value.includes('@')){ shake(email); email.focus(); return false; }
  if(pass.value.length < 6){ shake(pass); pass.focus(); return false; }
  return true;
}

// Add subtle reveal on scroll for cards/hero
document.addEventListener('DOMContentLoaded', () => {
  const els = document.querySelectorAll('.card, .hero');
  const io = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if(e.isIntersecting) e.target.classList.add('fade-in');
    });
  }, { threshold: .2 });
  els.forEach(el => io.observe(el));
});
