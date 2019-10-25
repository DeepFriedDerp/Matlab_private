function [aeroForces] = paramSpace_1_1_1_2_1_2_2(sailStates,airStates)

	CL = (4.002651)*sailStates.alpha + (-0.017795)*sailStates.beta + (-2.717545)*sailStates.p + (35.435841)*sailStates.q + (-0.081301)*sailStates.r + (0.010614)*sailStates.de;
	CD = -0.061830;
	CY = (-0.024083)*sailStates.alpha + (-0.024437)*sailStates.beta + (0.135867)*sailStates.p + (-0.299436)*sailStates.q + (0.017908)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.385856)*sailStates.alpha + (-0.060912)*sailStates.beta + (-1.388535)*sailStates.p + (11.478906)*sailStates.q + (0.061750)*sailStates.r + (0.000722)*sailStates.de;
	Cm = (-14.549489)*sailStates.alpha + (0.082837)*sailStates.beta + (9.531754)*sailStates.p + (-142.147675)*sailStates.q + (0.317711)*sailStates.r + (-0.069412)*sailStates.de;
	Cn = (0.194483)*sailStates.alpha + (-0.010492)*sailStates.beta + (-0.469909)*sailStates.p + (3.042985)*sailStates.q + (-0.029805)*sailStates.r + (0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end