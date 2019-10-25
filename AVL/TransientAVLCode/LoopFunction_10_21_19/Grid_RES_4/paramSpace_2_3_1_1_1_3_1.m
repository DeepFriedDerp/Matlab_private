function [aeroForces] = paramSpace_2_3_1_1_1_3_1(sailStates,airStates)

	CL = (6.927455)*sailStates.alpha + (-0.165215)*sailStates.beta + (-1.640789)*sailStates.p + (25.072983)*sailStates.q + (2.436052)*sailStates.r + (0.010076)*sailStates.de;
	CD = -2.781520;
	CY = (-0.684800)*sailStates.alpha + (-0.025862)*sailStates.beta + (1.261932)*sailStates.p + (-1.915490)*sailStates.q + (0.082914)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (2.012277)*sailStates.alpha + (-0.607911)*sailStates.beta + (-0.461136)*sailStates.p + (2.147745)*sailStates.q + (2.272818)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-16.611115)*sailStates.alpha + (0.615149)*sailStates.beta + (6.487149)*sailStates.p + (-113.694908)*sailStates.q + (-8.203825)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (2.638998)*sailStates.alpha + (-0.033852)*sailStates.beta + (-2.810588)*sailStates.p + (14.310359)*sailStates.q + (-0.033731)*sailStates.r + (0.000755)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end