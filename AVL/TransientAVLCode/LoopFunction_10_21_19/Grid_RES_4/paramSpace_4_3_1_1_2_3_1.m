function [aeroForces] = paramSpace_4_3_1_1_2_3_1(sailStates,airStates)

	CL = (6.270835)*sailStates.alpha + (-0.217058)*sailStates.beta + (-1.798710)*sailStates.p + (35.877773)*sailStates.q + (2.884362)*sailStates.r + (0.011928)*sailStates.de;
	CD = -2.315670;
	CY = (-0.330891)*sailStates.alpha + (-0.025612)*sailStates.beta + (1.127112)*sailStates.p + (0.662189)*sailStates.q + (-0.224268)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (1.293022)*sailStates.alpha + (-0.648869)*sailStates.beta + (-0.501942)*sailStates.p + (5.062133)*sailStates.q + (2.447915)*sailStates.r + (-0.000819)*sailStates.de;
	Cm = (-9.529662)*sailStates.alpha + (0.796977)*sailStates.beta + (3.958879)*sailStates.p + (-110.966957)*sailStates.q + (-9.516438)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (2.013193)*sailStates.alpha + (0.114483)*sailStates.beta + (-2.547177)*sailStates.p + (11.058254)*sailStates.q + (0.039529)*sailStates.r + (-0.000012)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end