function [aeroForces] = paramSpace_3_4_3_1_1_1_3(sailStates,airStates)

	CL = (5.052056)*sailStates.alpha + (0.360887)*sailStates.beta + (-3.356642)*sailStates.p + (39.313347)*sailStates.q + (-1.327631)*sailStates.r + (0.010772)*sailStates.de;
	CD = -1.670980;
	CY = (-0.469462)*sailStates.alpha + (-0.022540)*sailStates.beta + (-0.657727)*sailStates.p + (-1.915491)*sailStates.q + (0.043042)*sailStates.r + (-0.000416)*sailStates.de;

	Cl = (1.240139)*sailStates.alpha + (0.486425)*sailStates.beta + (-1.843682)*sailStates.p + (15.142119)*sailStates.q + (-1.386829)*sailStates.r + (0.001345)*sailStates.de;
	Cm = (-13.101747)*sailStates.alpha + (-1.449301)*sailStates.beta + (11.940727)*sailStates.p + (-159.650192)*sailStates.q + (4.515228)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (0.898654)*sailStates.alpha + (-0.025096)*sailStates.beta + (1.653815)*sailStates.p + (-6.574253)*sailStates.q + (-0.009478)*sailStates.r + (0.000375)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end