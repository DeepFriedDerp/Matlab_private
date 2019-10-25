function [aeroForces] = paramSpace_1_1_1_1_3_1_2(sailStates,airStates)

	CL = (-0.276914)*sailStates.alpha + (0.082947)*sailStates.beta + (-6.175332)*sailStates.p + (59.703362)*sailStates.q + (0.203688)*sailStates.r + (0.011407)*sailStates.de;
	CD = -2.151780;
	CY = (1.174244)*sailStates.alpha + (-0.029328)*sailStates.beta + (0.481544)*sailStates.p + (3.153690)*sailStates.q + (0.084609)*sailStates.r + (0.000718)*sailStates.de;

	Cl = (-1.838567)*sailStates.alpha + (-0.380856)*sailStates.beta + (-4.300866)*sailStates.p + (38.278568)*sailStates.q + (0.547637)*sailStates.r + (0.005849)*sailStates.de;
	Cm = (6.917983)*sailStates.alpha + (-0.347185)*sailStates.beta + (22.246149)*sailStates.p + (-242.553848)*sailStates.q + (-0.552329)*sailStates.r + (-0.083046)*sailStates.de;
	Cn = (-4.586654)*sailStates.alpha + (-0.071693)*sailStates.beta + (-1.940942)*sailStates.p + (9.867150)*sailStates.q + (-0.111664)*sailStates.r + (-0.000624)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end