function [aeroForces] = paramSpace_2_3_4_2_1_1_2(sailStates,airStates)

	CL = (4.389804)*sailStates.alpha + (0.081658)*sailStates.beta + (-2.601111)*sailStates.p + (36.109303)*sailStates.q + (-1.128436)*sailStates.r + (0.011331)*sailStates.de;
	CD = -0.343120;
	CY = (-0.098204)*sailStates.alpha + (-0.025169)*sailStates.beta + (-0.405592)*sailStates.p + (-0.769435)*sailStates.q + (-0.026665)*sailStates.r + (-0.000166)*sailStates.de;

	Cl = (1.218990)*sailStates.alpha + (0.258108)*sailStates.beta + (-1.205046)*sailStates.p + (9.888932)*sailStates.q + (-0.971672)*sailStates.r + (0.000318)*sailStates.de;
	Cm = (-14.109162)*sailStates.alpha + (-0.292315)*sailStates.beta + (8.625752)*sailStates.p + (-137.556381)*sailStates.q + (3.803888)*sailStates.r + (-0.070101)*sailStates.de;
	Cn = (-0.017448)*sailStates.alpha + (0.015201)*sailStates.beta + (0.884945)*sailStates.p + (-3.365078)*sailStates.q + (-0.000626)*sailStates.r + (0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end