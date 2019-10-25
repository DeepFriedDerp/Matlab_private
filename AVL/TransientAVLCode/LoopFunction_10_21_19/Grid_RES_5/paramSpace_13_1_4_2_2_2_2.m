function [aeroForces] = paramSpace_13_1_4_2_2_2_2(sailStates,airStates)

	CL = (3.972891)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.757051)*sailStates.p + (38.706650)*sailStates.q + (1.406511)*sailStates.r + (0.011077)*sailStates.de;
	CD = -0.062500;
	CY = (0.073359)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.428996)*sailStates.p + (0.261302)*sailStates.q + (-0.075616)*sailStates.r + (0.000056)*sailStates.de;

	Cl = (1.279416)*sailStates.alpha + (-0.224919)*sailStates.beta + (-1.362982)*sailStates.p + (11.950924)*sailStates.q + (1.119646)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-12.872877)*sailStates.alpha + (0.000000)*sailStates.beta + (8.786374)*sailStates.p + (-141.841248)*sailStates.q + (-4.746431)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (-0.245445)*sailStates.alpha + (0.039659)*sailStates.beta + (-0.756865)*sailStates.p + (2.301694)*sailStates.q + (-0.021932)*sailStates.r + (-0.000025)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end