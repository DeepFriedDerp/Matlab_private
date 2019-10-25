function [aeroForces] = paramSpace_2_3_2_2_3_1_1(sailStates,airStates)

	CL = (4.786727)*sailStates.alpha + (0.112395)*sailStates.beta + (-2.182941)*sailStates.p + (32.968754)*sailStates.q + (-1.494918)*sailStates.r + (0.011079)*sailStates.de;
	CD = -0.610710;
	CY = (0.197979)*sailStates.alpha + (-0.024714)*sailStates.beta + (-0.667967)*sailStates.p + (0.668511)*sailStates.q + (-0.043804)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.357672)*sailStates.alpha + (0.338550)*sailStates.beta + (-0.866613)*sailStates.p + (6.868467)*sailStates.q + (-1.304666)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.302309)*sailStates.alpha + (-0.439250)*sailStates.beta + (7.099898)*sailStates.p + (-125.787453)*sailStates.q + (5.068339)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.729163)*sailStates.alpha + (0.019251)*sailStates.beta + (1.428073)*sailStates.p + (-6.816782)*sailStates.q + (0.011803)*sailStates.r + (-0.000295)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end