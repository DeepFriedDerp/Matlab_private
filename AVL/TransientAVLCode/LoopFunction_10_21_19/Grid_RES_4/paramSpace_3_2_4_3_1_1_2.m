function [aeroForces] = paramSpace_3_2_4_3_1_1_2(sailStates,airStates)

	CL = (4.121833)*sailStates.alpha + (-0.010776)*sailStates.beta + (-2.544259)*sailStates.p + (34.240501)*sailStates.q + (-0.175838)*sailStates.r + (0.010837)*sailStates.de;
	CD = -0.082350;
	CY = (-0.061531)*sailStates.alpha + (-0.025207)*sailStates.beta + (-0.129730)*sailStates.p + (-0.498142)*sailStates.q + (0.008450)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.275820)*sailStates.alpha + (0.081156)*sailStates.beta + (-1.215673)*sailStates.p + (9.792216)*sailStates.q + (-0.238498)*sailStates.r + (0.000376)*sailStates.de;
	Cm = (-14.795664)*sailStates.alpha + (0.025637)*sailStates.beta + (8.839439)*sailStates.p + (-136.960373)*sailStates.q + (0.571223)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (-0.078324)*sailStates.alpha + (-0.005762)*sailStates.beta + (0.393044)*sailStates.p + (-1.790607)*sailStates.q + (-0.005075)*sailStates.r + (0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end