function [aeroForces] = paramSpace_11_1_2_1_2_1_1(sailStates,airStates)

	CL = (4.921422)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.007899)*sailStates.p + (28.368402)*sailStates.q + (-1.116334)*sailStates.r + (0.010284)*sailStates.de;
	CD = -0.882690;
	CY = (0.282530)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.680201)*sailStates.p + (1.178226)*sailStates.q + (0.071450)*sailStates.r + (0.000251)*sailStates.de;

	Cl = (1.366995)*sailStates.alpha + (0.292636)*sailStates.beta + (-0.779010)*sailStates.p + (5.272834)*sailStates.q + (-1.140885)*sailStates.r + (-0.000286)*sailStates.de;
	Cm = (-15.954037)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.605015)*sailStates.p + (-123.632645)*sailStates.q + (3.747398)*sailStates.r + (-0.068451)*sailStates.de;
	Cn = (-1.046892)*sailStates.alpha + (-0.030757)*sailStates.beta + (1.554398)*sailStates.p + (-8.038584)*sailStates.q + (-0.034846)*sailStates.r + (-0.000453)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end