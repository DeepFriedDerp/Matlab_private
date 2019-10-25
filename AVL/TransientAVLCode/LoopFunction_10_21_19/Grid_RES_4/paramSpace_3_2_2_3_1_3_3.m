function [aeroForces] = paramSpace_3_2_2_3_1_3_3(sailStates,airStates)

	CL = (4.380661)*sailStates.alpha + (0.078069)*sailStates.beta + (-2.839042)*sailStates.p + (37.877476)*sailStates.q + (1.145722)*sailStates.r + (0.011342)*sailStates.de;
	CD = -0.245410;
	CY = (-0.021573)*sailStates.alpha + (-0.025157)*sailStates.beta + (0.467516)*sailStates.p + (-0.563441)*sailStates.q + (-0.030623)*sailStates.r + (-0.000122)*sailStates.de;

	Cl = (1.534852)*sailStates.alpha + (-0.185545)*sailStates.beta + (-1.439278)*sailStates.p + (12.175720)*sailStates.q + (0.962356)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.464701)*sailStates.alpha + (-0.286735)*sailStates.beta + (9.424963)*sailStates.p + (-144.107025)*sailStates.q + (-3.864305)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.054987)*sailStates.alpha + (0.014222)*sailStates.beta + (-0.955043)*sailStates.p + (4.494680)*sailStates.q + (0.005651)*sailStates.r + (0.000254)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end