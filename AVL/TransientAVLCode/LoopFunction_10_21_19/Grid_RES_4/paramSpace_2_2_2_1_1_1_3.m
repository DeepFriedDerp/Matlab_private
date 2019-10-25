function [aeroForces] = paramSpace_2_2_2_1_1_1_3(sailStates,airStates)

	CL = (5.228235)*sailStates.alpha + (-0.184968)*sailStates.beta + (-3.526215)*sailStates.p + (44.710934)*sailStates.q + (-2.234482)*sailStates.r + (0.012034)*sailStates.de;
	CD = -1.839470;
	CY = (-0.521486)*sailStates.alpha + (-0.024400)*sailStates.beta + (-0.895308)*sailStates.p + (-1.471504)*sailStates.q + (-0.058630)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (1.283081)*sailStates.alpha + (0.456597)*sailStates.beta + (-1.975944)*sailStates.p + (17.367828)*sailStates.q + (-2.054653)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-11.357219)*sailStates.alpha + (0.735203)*sailStates.beta + (11.408834)*sailStates.p + (-162.286758)*sailStates.q + (7.604167)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.415377)*sailStates.alpha + (0.033304)*sailStates.beta + (1.933621)*sailStates.p + (-7.192976)*sailStates.q + (0.000416)*sailStates.r + (0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end