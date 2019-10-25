function [aeroForces] = paramSpace_4_1_2_1_2_2_1(sailStates,airStates)

	CL = (4.235943)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.937003)*sailStates.p + (27.850693)*sailStates.q + (0.468626)*sailStates.r + (0.009965)*sailStates.de;
	CD = -0.481690;
	CY = (0.013461)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.321996)*sailStates.p + (0.696926)*sailStates.q + (0.045229)*sailStates.r + (0.000148)*sailStates.de;

	Cl = (0.878218)*sailStates.alpha + (-0.188950)*sailStates.beta + (-0.742864)*sailStates.p + (5.148645)*sailStates.q + (0.614784)*sailStates.r + (-0.000363)*sailStates.de;
	Cm = (-14.837002)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.217505)*sailStates.p + (-121.395615)*sailStates.q + (-1.546897)*sailStates.r + (-0.067712)*sailStates.de;
	Cn = (0.481005)*sailStates.alpha + (-0.026555)*sailStates.beta + (-0.837387)*sailStates.p + (3.516630)*sailStates.q + (-0.016584)*sailStates.r + (-0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end