function [aeroForces] = paramSpace_9_1_2_2_2_1_1(sailStates,airStates)

	CL = (4.249501)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.357005)*sailStates.p + (32.882557)*sailStates.q + (-0.484445)*sailStates.r + (0.010937)*sailStates.de;
	CD = -0.138590;
	CY = (0.080191)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.292140)*sailStates.p + (0.438541)*sailStates.q + (0.010186)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.230913)*sailStates.alpha + (0.128318)*sailStates.beta + (-1.036965)*sailStates.p + (8.068634)*sailStates.q + (-0.491656)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-15.034154)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.188672)*sailStates.p + (-131.751755)*sailStates.q + (1.651690)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (-0.292225)*sailStates.alpha + (-0.004481)*sailStates.beta + (0.665964)*sailStates.p + (-3.400709)*sailStates.q + (-0.004839)*sailStates.r + (-0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end