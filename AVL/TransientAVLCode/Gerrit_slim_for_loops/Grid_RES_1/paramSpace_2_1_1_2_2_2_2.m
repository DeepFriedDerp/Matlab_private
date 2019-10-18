function [aeroForces] = paramSpace_2_1_1_2_2_2_2(sailStates,airStates)

	CL = (5.985826)*sailStates.alpha + (-1.892166)*sailStates.beta + (-3.706097)*sailStates.p + (50.687946)*sailStates.q + (2.143692)*sailStates.r + (0.012852)*sailStates.de;
	CD = -5.813210;
	CY = (1.975366)*sailStates.alpha + (-0.123319)*sailStates.beta + (0.233286)*sailStates.p + (15.733427)*sailStates.q + (-0.025141)*sailStates.r + (0.003333)*sailStates.de;

	Cl = (-4.925331)*sailStates.alpha + (-1.010565)*sailStates.beta + (-1.882069)*sailStates.p + (16.250687)*sailStates.q + (2.353853)*sailStates.r + (0.001641)*sailStates.de;
	Cm = (2.497282)*sailStates.alpha + (8.348153)*sailStates.beta + (11.667188)*sailStates.p + (-165.201355)*sailStates.q + (-7.545373)*sailStates.r + (-0.068319)*sailStates.de;
	Cn = (-2.202867)*sailStates.alpha + (0.204720)*sailStates.beta + (-0.741903)*sailStates.p + (-9.581739)*sailStates.q + (-0.191828)*sailStates.r + (-0.004331)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end