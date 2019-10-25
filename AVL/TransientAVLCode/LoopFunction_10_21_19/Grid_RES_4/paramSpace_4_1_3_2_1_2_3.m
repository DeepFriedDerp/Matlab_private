function [aeroForces] = paramSpace_4_1_3_2_1_2_3(sailStates,airStates)

	CL = (3.844343)*sailStates.alpha + (0.262941)*sailStates.beta + (-2.825992)*sailStates.p + (38.465054)*sailStates.q + (1.332877)*sailStates.r + (0.010621)*sailStates.de;
	CD = 0.046970;
	CY = (-0.069137)*sailStates.alpha + (-0.028261)*sailStates.beta + (0.395227)*sailStates.p + (-1.057313)*sailStates.q + (-0.078653)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.471690)*sailStates.alpha + (-0.061154)*sailStates.beta + (-1.505365)*sailStates.p + (13.528648)*sailStates.q + (0.979958)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.258867)*sailStates.alpha + (-0.962244)*sailStates.beta + (9.096354)*sailStates.p + (-143.598221)*sailStates.q + (-4.458303)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.255197)*sailStates.alpha + (0.030050)*sailStates.beta + (-0.597703)*sailStates.p + (2.362649)*sailStates.q + (-0.016445)*sailStates.r + (0.000346)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end