function [aeroForces] = paramSpace_1_4_2_1_3_3_1(sailStates,airStates)

	CL = (4.613486)*sailStates.alpha + (-0.296686)*sailStates.beta + (-1.389755)*sailStates.p + (20.114725)*sailStates.q + (1.186616)*sailStates.r + (0.008510)*sailStates.de;
	CD = -1.577760;
	CY = (-0.138029)*sailStates.alpha + (-0.021492)*sailStates.beta + (0.645704)*sailStates.p + (1.002336)*sailStates.q + (0.128403)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (0.281621)*sailStates.alpha + (-0.449876)*sailStates.beta + (-0.323023)*sailStates.p + (0.494057)*sailStates.q + (1.345419)*sailStates.r + (-0.001005)*sailStates.de;
	Cm = (-14.542012)*sailStates.alpha + (1.161227)*sailStates.beta + (6.255829)*sailStates.p + (-107.565659)*sailStates.q + (-3.858440)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (1.381912)*sailStates.alpha + (-0.067569)*sailStates.beta + (-1.544467)*sailStates.p + (6.115138)*sailStates.q + (-0.026751)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end