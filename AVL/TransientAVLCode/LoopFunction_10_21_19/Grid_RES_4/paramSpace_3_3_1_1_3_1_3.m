function [aeroForces] = paramSpace_3_3_1_1_3_1_3(sailStates,airStates)

	CL = (6.956950)*sailStates.alpha + (0.175998)*sailStates.beta + (-3.410918)*sailStates.p + (39.358829)*sailStates.q + (-2.229974)*sailStates.r + (0.011011)*sailStates.de;
	CD = -2.827160;
	CY = (-0.283011)*sailStates.alpha + (-0.025345)*sailStates.beta + (-1.235113)*sailStates.p + (1.471503)*sailStates.q + (0.080798)*sailStates.r + (0.000322)*sailStates.de;

	Cl = (2.782653)*sailStates.alpha + (0.605751)*sailStates.beta + (-1.906915)*sailStates.p + (15.558284)*sailStates.q + (-2.155075)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-15.949871)*sailStates.alpha + (-0.716781)*sailStates.beta + (12.403981)*sailStates.p + (-162.286758)*sailStates.q + (7.578838)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.066739)*sailStates.alpha + (-0.034761)*sailStates.beta + (2.824506)*sailStates.p + (-14.226759)*sailStates.q + (-0.035846)*sailStates.r + (-0.000671)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end