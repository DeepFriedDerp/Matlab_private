function [aeroForces] = paramSpace_2_2_1_2_2_2_3(sailStates,airStates)

	CL = (3.953104)*sailStates.alpha + (-0.036591)*sailStates.beta + (-2.968439)*sailStates.p + (38.252678)*sailStates.q + (-0.400342)*sailStates.r + (0.011196)*sailStates.de;
	CD = 0.045150;
	CY = (-0.006491)*sailStates.alpha + (-0.025023)*sailStates.beta + (-0.114548)*sailStates.p + (0.100923)*sailStates.q + (-0.007519)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.399619)*sailStates.alpha + (0.043590)*sailStates.beta + (-1.552717)*sailStates.p + (13.038534)*sailStates.q + (-0.309368)*sailStates.r + (0.000922)*sailStates.de;
	Cm = (-14.307777)*sailStates.alpha + (0.162033)*sailStates.beta + (10.093943)*sailStates.p + (-148.239975)*sailStates.q + (1.389004)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (0.113879)*sailStates.alpha + (0.003307)*sailStates.beta + (0.146081)*sailStates.p + (-0.263121)*sailStates.q + (-0.004296)*sailStates.r + (-0.000022)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end