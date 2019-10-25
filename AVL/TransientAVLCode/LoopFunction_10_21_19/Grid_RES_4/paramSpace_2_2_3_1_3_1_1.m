function [aeroForces] = paramSpace_2_2_3_1_3_1_1(sailStates,airStates)

	CL = (7.323497)*sailStates.alpha + (-0.208000)*sailStates.beta + (-1.722978)*sailStates.p + (30.545752)*sailStates.q + (-2.878120)*sailStates.r + (0.011190)*sailStates.de;
	CD = -2.941490;
	CY = (0.695740)*sailStates.alpha + (-0.025449)*sailStates.beta + (-1.356141)*sailStates.p + (1.471502)*sailStates.q + (-0.088834)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.240180)*sailStates.alpha + (0.556211)*sailStates.beta + (-0.509434)*sailStates.p + (4.013412)*sailStates.q + (-2.563726)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-14.071207)*sailStates.alpha + (0.793064)*sailStates.beta + (5.116498)*sailStates.p + (-112.102478)*sailStates.q + (9.729335)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.613207)*sailStates.alpha + (0.042280)*sailStates.beta + (2.983500)*sailStates.p + (-14.668267)*sailStates.q + (0.029627)*sailStates.r + (-0.000625)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end