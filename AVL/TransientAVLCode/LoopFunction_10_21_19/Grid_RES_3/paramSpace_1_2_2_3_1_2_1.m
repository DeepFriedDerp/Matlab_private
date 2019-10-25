function [aeroForces] = paramSpace_1_2_2_3_1_2_1(sailStates,airStates)

	CL = (3.878008)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.262771)*sailStates.p + (33.040058)*sailStates.q + (-0.664147)*sailStates.r + (0.010631)*sailStates.de;
	CD = 0.061230;
	CY = (-0.072801)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.092209)*sailStates.p + (-0.665001)*sailStates.q + (-0.016259)*sailStates.r + (-0.000141)*sailStates.de;

	Cl = (1.058758)*sailStates.alpha + (0.072631)*sailStates.beta + (-0.975386)*sailStates.p + (7.885698)*sailStates.q + (-0.427176)*sailStates.r + (0.000032)*sailStates.de;
	Cm = (-13.953322)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.642811)*sailStates.p + (-129.097870)*sailStates.q + (2.253350)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.138697)*sailStates.alpha + (0.012807)*sailStates.beta + (0.088437)*sailStates.p + (0.551590)*sailStates.q + (-0.029403)*sailStates.r + (0.000183)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end