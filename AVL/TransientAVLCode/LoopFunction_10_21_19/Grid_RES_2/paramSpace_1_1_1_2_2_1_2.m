function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.214331)*sailStates.alpha + (-0.205231)*sailStates.beta + (-2.756867)*sailStates.p + (38.090046)*sailStates.q + (-1.371438)*sailStates.r + (0.011124)*sailStates.de;
	CD = -0.162020;
	CY = (0.022068)*sailStates.alpha + (-0.025707)*sailStates.beta + (-0.498894)*sailStates.p + (0.513811)*sailStates.q + (-0.065717)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.493876)*sailStates.alpha + (0.166535)*sailStates.beta + (-1.396008)*sailStates.p + (12.184361)*sailStates.q + (-1.117176)*sailStates.r + (0.000685)*sailStates.de;
	Cm = (-13.648641)*sailStates.alpha + (0.800281)*sailStates.beta + (8.869370)*sailStates.p + (-141.379639)*sailStates.q + (4.629135)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.124245)*sailStates.alpha + (0.030852)*sailStates.beta + (0.938660)*sailStates.p + (-3.935237)*sailStates.q + (0.000612)*sailStates.r + (-0.000216)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end