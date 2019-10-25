function [aeroForces] = paramSpace_2_1_2_2_1_3_1(sailStates,airStates)

	CL = (4.545500)*sailStates.alpha + (0.190702)*sailStates.beta + (-2.126235)*sailStates.p + (30.202261)*sailStates.q + (0.927904)*sailStates.r + (0.010434)*sailStates.de;
	CD = -0.532530;
	CY = (-0.193646)*sailStates.alpha + (-0.023766)*sailStates.beta + (0.535144)*sailStates.p + (-0.870359)*sailStates.q + (0.035106)*sailStates.r + (-0.000185)*sailStates.de;

	Cl = (1.363496)*sailStates.alpha + (-0.168642)*sailStates.beta + (-0.915570)*sailStates.p + (6.935622)*sailStates.q + (0.909572)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-15.131755)*sailStates.alpha + (-0.724375)*sailStates.beta + (7.658309)*sailStates.p + (-125.466835)*sailStates.q + (-3.123312)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.689645)*sailStates.alpha + (-0.018273)*sailStates.beta + (-1.229387)*sailStates.p + (6.422626)*sailStates.q + (-0.017088)*sailStates.r + (0.000347)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end