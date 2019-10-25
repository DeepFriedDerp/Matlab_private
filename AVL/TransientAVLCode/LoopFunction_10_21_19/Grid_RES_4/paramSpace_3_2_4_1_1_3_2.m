function [aeroForces] = paramSpace_3_2_4_1_1_3_2(sailStates,airStates)

	CL = (7.686529)*sailStates.alpha + (0.227828)*sailStates.beta + (-2.607225)*sailStates.p + (37.746574)*sailStates.q + (3.011073)*sailStates.r + (0.011528)*sailStates.de;
	CD = -3.009170;
	CY = (-0.227804)*sailStates.alpha + (-0.025759)*sailStates.beta + (1.421826)*sailStates.p + (-1.693498)*sailStates.q + (-0.093370)*sailStates.r + (-0.000365)*sailStates.de;

	Cl = (2.933861)*sailStates.alpha + (-0.576120)*sailStates.beta + (-1.231913)*sailStates.p + (10.721345)*sailStates.q + (2.706070)*sailStates.r + (0.000349)*sailStates.de;
	Cm = (-15.229568)*sailStates.alpha + (-0.902433)*sailStates.beta + (8.063603)*sailStates.p + (-136.398376)*sailStates.q + (-10.214411)*sailStates.r + (-0.069983)*sailStates.de;
	Cn = (0.574048)*sailStates.alpha + (0.044233)*sailStates.beta + (-3.053780)*sailStates.p + (14.750709)*sailStates.q + (0.027976)*sailStates.r + (0.000723)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end