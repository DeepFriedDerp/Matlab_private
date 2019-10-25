function [aeroForces] = paramSpace_2_2_2_1_2_2_3(sailStates,airStates)

	CL = (3.705720)*sailStates.alpha + (-0.032285)*sailStates.beta + (-3.451195)*sailStates.p + (42.145233)*sailStates.q + (-0.454712)*sailStates.r + (0.011486)*sailStates.de;
	CD = 0.035330;
	CY = (-0.015922)*sailStates.alpha + (-0.025063)*sailStates.beta + (-0.119107)*sailStates.p + (0.221995)*sailStates.q + (-0.007814)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.399939)*sailStates.alpha + (0.039295)*sailStates.beta + (-1.946995)*sailStates.p + (16.695324)*sailStates.q + (-0.336978)*sailStates.r + (0.001574)*sailStates.de;
	Cm = (-13.451544)*sailStates.alpha + (0.125846)*sailStates.beta + (11.708097)*sailStates.p + (-161.490479)*sailStates.q + (1.548868)*sailStates.r + (-0.072745)*sailStates.de;
	Cn = (0.190301)*sailStates.alpha + (0.003132)*sailStates.beta + (0.138196)*sailStates.p + (-0.283845)*sailStates.q + (-0.004684)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end