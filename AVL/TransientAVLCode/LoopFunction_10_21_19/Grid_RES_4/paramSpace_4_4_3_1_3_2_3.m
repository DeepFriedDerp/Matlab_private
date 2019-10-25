function [aeroForces] = paramSpace_4_4_3_1_3_2_3(sailStates,airStates)

	CL = (3.302909)*sailStates.alpha + (-0.202581)*sailStates.beta + (-3.362126)*sailStates.p + (42.028561)*sailStates.q + (0.900636)*sailStates.r + (0.010891)*sailStates.de;
	CD = 0.097800;
	CY = (0.149008)*sailStates.alpha + (-0.028080)*sailStates.beta + (0.068028)*sailStates.p + (1.002334)*sailStates.q + (-0.013496)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (1.125141)*sailStates.alpha + (-0.139969)*sailStates.beta + (-1.836946)*sailStates.p + (15.888865)*sailStates.q + (0.605789)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-12.081805)*sailStates.alpha + (0.765445)*sailStates.beta + (11.425700)*sailStates.p + (-160.076111)*sailStates.q + (-3.081654)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.443296)*sailStates.alpha + (0.026239)*sailStates.beta + (0.151072)*sailStates.p + (-2.814562)*sailStates.q + (-0.077951)*sailStates.r + (-0.000291)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end