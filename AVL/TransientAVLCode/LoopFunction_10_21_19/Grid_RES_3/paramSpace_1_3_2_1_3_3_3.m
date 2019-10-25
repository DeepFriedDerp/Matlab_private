function [aeroForces] = paramSpace_1_3_2_1_3_3_3(sailStates,airStates)

	CL = (4.842635)*sailStates.alpha + (-0.211061)*sailStates.beta + (-3.149577)*sailStates.p + (35.430763)*sailStates.q + (0.634564)*sailStates.r + (0.009630)*sailStates.de;
	CD = -1.507110;
	CY = (0.435993)*sailStates.alpha + (-0.019135)*sailStates.beta + (0.478555)*sailStates.p + (2.260756)*sailStates.q + (0.084382)*sailStates.r + (0.000485)*sailStates.de;

	Cl = (1.232154)*sailStates.alpha + (-0.357861)*sailStates.beta + (-1.753877)*sailStates.p + (14.234113)*sailStates.q + (0.890573)*sailStates.r + (0.001261)*sailStates.de;
	Cm = (-14.095975)*sailStates.alpha + (0.896255)*sailStates.beta + (11.860662)*sailStates.p + (-156.476898)*sailStates.q + (-2.070188)*sailStates.r + (-0.069804)*sailStates.de;
	Cn = (-0.603325)*sailStates.alpha + (-0.052620)*sailStates.beta + (-1.440786)*sailStates.p + (5.927222)*sailStates.q + (-0.042487)*sailStates.r + (-0.000503)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end