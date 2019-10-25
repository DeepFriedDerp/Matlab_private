function [aeroForces] = paramSpace_2_4_2_1_2_3_3(sailStates,airStates)

	CL = (5.794343)*sailStates.alpha + (-0.422217)*sailStates.beta + (-3.373685)*sailStates.p + (39.219833)*sailStates.q + (1.769960)*sailStates.r + (0.010777)*sailStates.de;
	CD = -2.161480;
	CY = (0.368184)*sailStates.alpha + (-0.024526)*sailStates.beta + (0.931512)*sailStates.p + (0.221995)*sailStates.q + (0.061047)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.852472)*sailStates.alpha + (-0.583152)*sailStates.beta + (-1.854289)*sailStates.p + (15.112528)*sailStates.q + (1.748175)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-14.061625)*sailStates.alpha + (1.658510)*sailStates.beta + (12.135131)*sailStates.p + (-160.446381)*sailStates.q + (-5.991792)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-0.942647)*sailStates.alpha + (-0.026847)*sailStates.beta + (-2.216047)*sailStates.p + (10.376857)*sailStates.q + (-0.022687)*sailStates.r + (0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end