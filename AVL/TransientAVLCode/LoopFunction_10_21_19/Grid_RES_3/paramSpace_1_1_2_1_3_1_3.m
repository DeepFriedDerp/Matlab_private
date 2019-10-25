function [aeroForces] = paramSpace_1_1_2_1_3_1_3(sailStates,airStates)

	CL = (7.505209)*sailStates.alpha + (-0.716871)*sailStates.beta + (-3.453427)*sailStates.p + (49.551365)*sailStates.q + (-3.855534)*sailStates.r + (0.012457)*sailStates.de;
	CD = -3.102240;
	CY = (-0.255291)*sailStates.alpha + (-0.030527)*sailStates.beta + (-1.593952)*sailStates.p + (2.260759)*sailStates.q + (-0.281057)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.223242)*sailStates.alpha + (0.469620)*sailStates.beta + (-1.934631)*sailStates.p + (19.023104)*sailStates.q + (-3.296942)*sailStates.r + (0.001493)*sailStates.de;
	Cm = (-12.390712)*sailStates.alpha + (2.672229)*sailStates.beta + (9.239261)*sailStates.p + (-156.476898)*sailStates.q + (12.796518)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.950288)*sailStates.alpha + (0.134271)*sailStates.beta + (3.245054)*sailStates.p + (-15.028986)*sailStates.q + (0.051001)*sailStates.r + (-0.000960)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end