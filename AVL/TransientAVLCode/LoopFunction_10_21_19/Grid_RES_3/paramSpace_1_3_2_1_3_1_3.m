function [aeroForces] = paramSpace_1_3_2_1_3_1_3(sailStates,airStates)

	CL = (7.505209)*sailStates.alpha + (0.716871)*sailStates.beta + (-3.453428)*sailStates.p + (49.551357)*sailStates.q + (-3.855534)*sailStates.r + (0.012457)*sailStates.de;
	CD = -3.102240;
	CY = (-0.255291)*sailStates.alpha + (-0.019135)*sailStates.beta + (-1.593952)*sailStates.p + (2.260759)*sailStates.q + (-0.281057)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (3.150721)*sailStates.alpha + (0.931739)*sailStates.beta + (-1.849996)*sailStates.p + (17.962242)*sailStates.q + (-3.282018)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-12.390710)*sailStates.alpha + (-2.672228)*sailStates.beta + (9.239261)*sailStates.p + (-156.476898)*sailStates.q + (12.796518)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (1.768289)*sailStates.alpha + (0.112827)*sailStates.beta + (3.259977)*sailStates.p + (-15.216044)*sailStates.q + (0.053632)*sailStates.r + (-0.000960)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end