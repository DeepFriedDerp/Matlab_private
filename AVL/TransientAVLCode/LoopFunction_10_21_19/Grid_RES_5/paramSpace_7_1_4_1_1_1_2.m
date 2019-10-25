function [aeroForces] = paramSpace_7_1_4_1_1_1_2(sailStates,airStates)

	CL = (4.450145)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.112371)*sailStates.p + (39.879498)*sailStates.q + (-1.223520)*sailStates.r + (0.011550)*sailStates.de;
	CD = -0.560210;
	CY = (-0.216114)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.476813)*sailStates.p + (-0.910010)*sailStates.q + (-0.016747)*sailStates.r + (-0.000199)*sailStates.de;

	Cl = (1.374735)*sailStates.alpha + (0.275246)*sailStates.beta + (-1.640413)*sailStates.p + (13.858141)*sailStates.q + (-1.104168)*sailStates.r + (0.001040)*sailStates.de;
	Cm = (-13.764417)*sailStates.alpha + (0.000000)*sailStates.beta + (10.443050)*sailStates.p + (-151.817017)*sailStates.q + (4.133991)*sailStates.r + (-0.071941)*sailStates.de;
	Cn = (0.409445)*sailStates.alpha + (0.009612)*sailStates.beta + (1.064469)*sailStates.p + (-4.118149)*sailStates.q + (0.000524)*sailStates.r + (0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end