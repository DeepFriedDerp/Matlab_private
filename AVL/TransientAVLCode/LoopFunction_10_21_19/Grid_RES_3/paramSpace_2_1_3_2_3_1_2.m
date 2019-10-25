function [aeroForces] = paramSpace_2_1_3_2_3_1_2(sailStates,airStates)

	CL = (4.714039)*sailStates.alpha + (-0.208297)*sailStates.beta + (-2.562675)*sailStates.p + (34.726238)*sailStates.q + (-1.197692)*sailStates.r + (0.010964)*sailStates.de;
	CD = -0.555480;
	CY = (0.095711)*sailStates.alpha + (-0.024637)*sailStates.beta + (-0.582869)*sailStates.p + (0.771086)*sailStates.q + (0.000072)*sailStates.r + (0.000166)*sailStates.de;

	Cl = (1.626002)*sailStates.alpha + (0.189178)*sailStates.beta + (-1.250340)*sailStates.p + (10.253169)*sailStates.q + (-1.076582)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.981496)*sailStates.alpha + (0.745496)*sailStates.beta + (8.779359)*sailStates.p + (-136.689392)*sailStates.q + (4.037257)*sailStates.r + (-0.069549)*sailStates.de;
	Cn = (-0.281969)*sailStates.alpha + (-0.000409)*sailStates.beta + (1.297577)*sailStates.p + (-6.588278)*sailStates.q + (-0.000285)*sailStates.r + (-0.000344)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end