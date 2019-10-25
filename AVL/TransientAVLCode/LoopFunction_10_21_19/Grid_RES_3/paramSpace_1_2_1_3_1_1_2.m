function [aeroForces] = paramSpace_1_2_1_3_1_1_2(sailStates,airStates)

	CL = (4.062504)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.559434)*sailStates.p + (37.301552)*sailStates.q + (-1.424857)*sailStates.r + (0.011060)*sailStates.de;
	CD = -0.124060;
	CY = (-0.064531)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.443648)*sailStates.p + (-0.491626)*sailStates.q + (-0.078180)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.204750)*sailStates.alpha + (0.241431)*sailStates.beta + (-1.196447)*sailStates.p + (10.415325)*sailStates.q + (-1.144925)*sailStates.r + (0.000365)*sailStates.de;
	Cm = (-12.814907)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.069672)*sailStates.p + (-136.151047)*sailStates.q + (4.801924)*sailStates.r + (-0.068436)*sailStates.de;
	Cn = (0.087590)*sailStates.alpha + (0.042571)*sailStates.beta + (0.828813)*sailStates.p + (-2.613427)*sailStates.q + (-0.018850)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end