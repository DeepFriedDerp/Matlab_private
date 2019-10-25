function [aeroForces] = paramSpace_3_3_3_1_3_3_3(sailStates,airStates)

	CL = (5.228233)*sailStates.alpha + (-0.184968)*sailStates.beta + (-3.526216)*sailStates.p + (44.710930)*sailStates.q + (2.234482)*sailStates.r + (0.012034)*sailStates.de;
	CD = -1.839470;
	CY = (0.521486)*sailStates.alpha + (-0.025553)*sailStates.beta + (0.895308)*sailStates.p + (1.471504)*sailStates.q + (-0.058630)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (1.248020)*sailStates.alpha + (-0.556536)*sailStates.beta + (-1.943297)*sailStates.p + (16.963942)*sailStates.q + (2.052499)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-11.357218)*sailStates.alpha + (0.735203)*sailStates.beta + (11.408835)*sailStates.p + (-162.286758)*sailStates.q + (-7.604168)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.368648)*sailStates.alpha + (0.033100)*sailStates.beta + (-1.935761)*sailStates.p + (7.219447)*sailStates.q + (0.000557)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end