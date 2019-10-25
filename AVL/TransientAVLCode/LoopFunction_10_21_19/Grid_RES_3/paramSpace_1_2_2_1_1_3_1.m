function [aeroForces] = paramSpace_1_2_2_1_1_3_1(sailStates,airStates)

	CL = (6.581746)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.535076)*sailStates.p + (20.695063)*sailStates.q + (2.100296)*sailStates.r + (0.008978)*sailStates.de;
	CD = -2.689910;
	CY = (-0.678066)*sailStates.alpha + (-0.025000)*sailStates.beta + (1.198661)*sailStates.p + (-2.260756)*sailStates.q + (0.211356)*sailStates.r + (-0.000475)*sailStates.de;

	Cl = (1.898037)*sailStates.alpha + (-0.509150)*sailStates.beta + (-0.449100)*sailStates.p + (1.216642)*sailStates.q + (2.084597)*sailStates.r + (-0.000686)*sailStates.de;
	Cm = (-18.229427)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.337237)*sailStates.p + (-113.665031)*sailStates.q + (-6.887081)*sailStates.r + (-0.066352)*sailStates.de;
	Cn = (2.606692)*sailStates.alpha + (-0.089777)*sailStates.beta + (-2.706758)*sailStates.p + (13.908440)*sailStates.q + (-0.095741)*sailStates.r + (0.000835)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end