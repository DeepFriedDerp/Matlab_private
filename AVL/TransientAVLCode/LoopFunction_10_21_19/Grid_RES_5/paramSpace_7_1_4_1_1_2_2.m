function [aeroForces] = paramSpace_7_1_4_1_1_2_2(sailStates,airStates)

	CL = (5.063694)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.076628)*sailStates.p + (38.242798)*sailStates.q + (1.336283)*sailStates.r + (0.011217)*sailStates.de;
	CD = -0.938540;
	CY = (0.044288)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.736142)*sailStates.p + (-0.910010)*sailStates.q + (0.025611)*sailStates.r + (-0.000199)*sailStates.de;

	Cl = (1.884381)*sailStates.alpha + (-0.331232)*sailStates.beta + (-1.629108)*sailStates.p + (13.426022)*sailStates.q + (1.292871)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-15.246465)*sailStates.alpha + (0.000000)*sailStates.beta + (10.746892)*sailStates.p + (-151.817017)*sailStates.q + (-4.566893)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (-0.205443)*sailStates.alpha + (-0.011567)*sailStates.beta + (-1.655930)*sailStates.p + (8.256150)*sailStates.q + (-0.010893)*sailStates.r + (0.000391)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end