function [aeroForces] = paramSpace_1_2_2_3_2_3_1(sailStates,airStates)

	CL = (3.996783)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.205193)*sailStates.p + (31.038872)*sailStates.q + (-0.131341)*sailStates.r + (0.010218)*sailStates.de;
	CD = -0.092500;
	CY = (-0.035719)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.133644)*sailStates.p + (-0.173374)*sailStates.q + (0.023565)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.094528)*sailStates.alpha + (-0.059906)*sailStates.beta + (-0.953204)*sailStates.p + (7.361112)*sailStates.q + (0.081786)*sailStates.r + (0.000003)*sailStates.de;
	Cm = (-14.736121)*sailStates.alpha + (0.000000)*sailStates.beta + (7.877855)*sailStates.p + (-128.476028)*sailStates.q + (0.482239)*sailStates.r + (-0.067684)*sailStates.de;
	Cn = (0.287684)*sailStates.alpha + (-0.010563)*sailStates.beta + (-0.437312)*sailStates.p + (2.540873)*sailStates.q + (-0.033053)*sailStates.r + (0.000087)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end