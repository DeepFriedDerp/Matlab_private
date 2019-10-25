function [aeroForces] = paramSpace_3_3_4_1_2_1_1(sailStates,airStates)

	CL = (5.847414)*sailStates.alpha + (0.144722)*sailStates.beta + (-1.623748)*sailStates.p + (25.166483)*sailStates.q + (-1.993765)*sailStates.r + (0.010075)*sailStates.de;
	CD = -2.168580;
	CY = (0.389093)*sailStates.alpha + (-0.025079)*sailStates.beta + (-0.988162)*sailStates.p + (0.221998)*sailStates.q + (0.064791)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (1.121328)*sailStates.alpha + (0.529888)*sailStates.beta + (-0.450528)*sailStates.p + (2.177329)*sailStates.q + (-1.911486)*sailStates.r + (-0.000847)*sailStates.de;
	Cm = (-14.832847)*sailStates.alpha + (-0.545262)*sailStates.beta + (6.292764)*sailStates.p + (-112.898659)*sailStates.q + (6.727546)*sailStates.r + (-0.067809)*sailStates.de;
	Cn = (-2.017719)*sailStates.alpha + (-0.030449)*sailStates.beta + (2.248379)*sailStates.p + (-10.507752)*sailStates.q + (-0.020346)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end