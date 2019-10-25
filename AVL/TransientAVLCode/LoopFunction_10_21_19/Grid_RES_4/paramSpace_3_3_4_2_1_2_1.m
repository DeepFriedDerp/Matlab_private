function [aeroForces] = paramSpace_3_3_4_2_1_2_1(sailStates,airStates)

	CL = (4.023183)*sailStates.alpha + (-0.040869)*sailStates.beta + (-2.156406)*sailStates.p + (31.777559)*sailStates.q + (0.493826)*sailStates.r + (0.010807)*sailStates.de;
	CD = 0.024670;
	CY = (-0.118567)*sailStates.alpha + (-0.024667)*sailStates.beta + (0.205979)*sailStates.p + (-0.668512)*sailStates.q + (-0.013571)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (1.043715)*sailStates.alpha + (-0.085806)*sailStates.beta + (-0.858176)*sailStates.p + (6.550385)*sailStates.q + (0.384062)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.453486)*sailStates.alpha + (0.176269)*sailStates.beta + (7.321045)*sailStates.p + (-125.787453)*sailStates.q + (-1.694275)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (0.216798)*sailStates.alpha + (0.004597)*sailStates.beta + (-0.379319)*sailStates.p + (1.963783)*sailStates.q + (0.003211)*sailStates.r + (0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end