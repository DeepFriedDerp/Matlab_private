function [aeroForces] = paramSpace_1_3_1_3_2_2_3(sailStates,airStates)

	CL = (3.782278)*sailStates.alpha + (0.197923)*sailStates.beta + (-2.737783)*sailStates.p + (37.192139)*sailStates.q + (-0.976412)*sailStates.r + (0.010626)*sailStates.de;
	CD = 0.083170;
	CY = (-0.005131)*sailStates.alpha + (-0.024351)*sailStates.beta + (-0.244057)*sailStates.p + (0.173375)*sailStates.q + (-0.043050)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.229418)*sailStates.alpha + (0.171851)*sailStates.beta + (-1.331348)*sailStates.p + (11.273007)*sailStates.q + (-0.698074)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-13.399824)*sailStates.alpha + (-0.781034)*sailStates.beta + (9.071419)*sailStates.p + (-141.665955)*sailStates.q + (3.313064)*sailStates.r + (-0.068173)*sailStates.de;
	Cn = (0.179115)*sailStates.alpha + (0.022463)*sailStates.beta + (0.329509)*sailStates.p + (-0.758983)*sailStates.q + (-0.023785)*sailStates.r + (-0.000062)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end