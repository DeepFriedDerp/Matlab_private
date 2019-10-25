function [aeroForces] = paramSpace_1_1_2_1_2_3_3(sailStates,airStates)

	CL = (5.435516)*sailStates.alpha + (0.264202)*sailStates.beta + (-3.193655)*sailStates.p + (35.185734)*sailStates.q + (1.064459)*sailStates.r + (0.009641)*sailStates.de;
	CD = -1.960690;
	CY = (0.344660)*sailStates.alpha + (-0.026316)*sailStates.beta + (0.745234)*sailStates.p + (0.589407)*sailStates.q + (0.131405)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.837039)*sailStates.alpha + (-0.340550)*sailStates.beta + (-1.865946)*sailStates.p + (15.217469)*sailStates.q + (1.228125)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-14.826855)*sailStates.alpha + (-1.072841)*sailStates.beta + (12.370080)*sailStates.p + (-158.590912)*sailStates.q + (-3.469815)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.714009)*sailStates.alpha + (-0.080741)*sailStates.beta + (-2.014750)*sailStates.p + (9.905156)*sailStates.q + (-0.080689)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end