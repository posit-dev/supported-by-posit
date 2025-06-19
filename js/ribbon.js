function addSupportedByPosit() {
    const header = document.getElementById('quarto-header');
    const navbarContainer = document.querySelector('.navbar-container.container-fluid');

    if (header && navbarContainer) {
        const headerHeight = header.offsetHeight;

        const styles = `
        #supported-by-posit {
            height: ${headerHeight}px;
            margin-top: -${headerHeight}px;
            margin-bottom: -${headerHeight}px;
            margin-left: 20px; 
            width: 100px;
            order: 9999;
            background-color: rgba(0, 0, 0, 0.25);
            // FOR LIGHT THEME: background-color: rgba(255, 255, 255, 0.5);
            padding: 10px;
            will-change: transform;
            transition: background-color 0.2s ease, transform 0.25s ease-in-out;
            transform: translateY(0);
        }
        @media (min-width: 992px) {
            .navbar-container.container-fluid, .navbar.navbar-expand-lg {
            padding-right: 0 !important;
            }
        }
        .headroom--unpinned #supported-by-posit {
            transform: translateY(-15px);
        }
        
        body.quarto-dark #supported-by-posit {
            background-color: #333333;
        }

        #supported-by-posit:hover {
            background-color: #000 !important;
            // FOR LIGHT THEME: background-color: #fff !important;
        }
        `

        const styleElement = document.createElement('style');
        styleElement.textContent = styles;
        document.head.appendChild(styleElement);
        
        const supportedByPositElement = document.createElement('a');
        supportedByPositElement.setAttribute('aria-label', 'Supported by Posit');
        supportedByPositElement.href = 'https://posit.co';
        supportedByPositElement.id = 'supported-by-posit';
        supportedByPositElement.target = '_blank';
        supportedByPositElement.title = 'Supported by Posit';
        supportedByPositElement.classList.add('d-none', 'd-lg-block');
        supportedByPositElement.innerHTML = '<img src="supported-by-posit-dark.svg" alt="Supported by Posit" style="width: 100%; height: 100%;">';
        // FOR LIGHT THEME: supportedByPositElement.innerHTML = '<img src="supported-by-posit-light.svg" alt="Supported by Posit" style="width: 100%; height: 100%;">';

        navbarContainer.appendChild(supportedByPositElement);
    } else {
        console.error('Could not find required elements');
    }
}

document.addEventListener('DOMContentLoaded', addSupportedByPosit);
