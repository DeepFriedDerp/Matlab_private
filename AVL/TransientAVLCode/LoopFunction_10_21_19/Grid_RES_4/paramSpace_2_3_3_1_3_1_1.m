function [aeroForces] = paramSpace_2_3_3_1_3_1_1(sailStates,airStates)

	CL = (7.323498)*sailStates.alpha + (0.208000)*sailStates.beta + (-1.722978)*sailStates.p + (30.545752)*sailStates.q + (-2.878120)*sailStates.r + (0.011190)*sailStates.de;
	CD = -2.941490;
	CY = (0.695740)*sailStates.alpha + (-0.024503)*sailStates.beta + (-1.356141)*sailStates.p + (1.471502)*sailStates.q + (-0.088834)*sailStates.r + (0.000312)*sailStates.de;

	Cl = (2.181044)*sailStates.alpha + (0.679669)*sailStates.beta + (-0.476785)*sailStates.p + (3.609532)*sailStates.q + (-2.561600)*sailStates.r + (-0.000884)*sailStates.de;
	Cm = (-14.071206)*sailStates.alpha + (-0.793065)*sailStates.beta + (5.116499)*sailStates.p + (-112.102478)*sailStates.q + (9.729332)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (-2.671280)*sailStates.alpha + (0.038723)*sailStates.beta + (2.985640)*sailStates.p + (-14.694737)*sailStates.q + (0.029766)*sailStates.r + (-0.000625)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end