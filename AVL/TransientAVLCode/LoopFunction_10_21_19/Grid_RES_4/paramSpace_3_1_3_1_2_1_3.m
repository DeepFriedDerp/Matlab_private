function [aeroForces] = paramSpace_3_1_3_1_2_1_3(sailStates,airStates)

	CL = (5.794343)*sailStates.alpha + (-0.422217)*sailStates.beta + (-3.373685)*sailStates.p + (39.219837)*sailStates.q + (-1.769960)*sailStates.r + (0.010777)*sailStates.de;
	CD = -2.161480;
	CY = (-0.368184)*sailStates.alpha + (-0.025046)*sailStates.beta + (-0.931512)*sailStates.p + (-0.221995)*sailStates.q + (0.061047)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.974226)*sailStates.alpha + (0.359600)*sailStates.beta + (-1.951982)*sailStates.p + (16.321089)*sailStates.q + (-1.741729)*sailStates.r + (0.001647)*sailStates.de;
	Cm = (-14.061625)*sailStates.alpha + (1.658510)*sailStates.beta + (12.135131)*sailStates.p + (-160.446365)*sailStates.q + (5.991794)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.059129)*sailStates.alpha + (-0.034944)*sailStates.beta + (2.222450)*sailStates.p + (-10.456070)*sailStates.q + (-0.023110)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end