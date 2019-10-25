function [aeroForces] = paramSpace_4_1_3_1_3_2_3(sailStates,airStates)

	CL = (3.302908)*sailStates.alpha + (0.202581)*sailStates.beta + (-3.362127)*sailStates.p + (42.028561)*sailStates.q + (0.900636)*sailStates.r + (0.010891)*sailStates.de;
	CD = 0.097800;
	CY = (0.149008)*sailStates.alpha + (-0.021492)*sailStates.beta + (0.068028)*sailStates.p + (1.002334)*sailStates.q + (-0.013496)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.227520)*sailStates.alpha + (-0.002524)*sailStates.beta + (-1.931320)*sailStates.p + (17.076740)*sailStates.q + (0.624604)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-12.081803)*sailStates.alpha + (-0.765445)*sailStates.beta + (11.425702)*sailStates.p + (-160.076126)*sailStates.q + (-3.081654)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.483697)*sailStates.alpha + (0.002104)*sailStates.beta + (0.169844)*sailStates.p + (-3.050845)*sailStates.q + (-0.081693)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end